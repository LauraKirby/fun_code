const url = 'https://pokeapi.co/api/v2/type';
const axios = require('axios');

interface PokemonType {
  name: string;
  url: string;
}

interface PokemonTypeByLocation {
  third?: string,
  thirdToLast?: string,
}

interface ResponseData {
  results: PokemonType[],
}

interface ApiResponse {
  status: number,
  statusText?: string,
  headers?: any,
  config?: any,
  request?: any,
  data?: ResponseData,
  message: string,
}

interface GpokeError {
  message: string
}

const gpoke = async (): Promise<PokemonType[] | string> => {
  return axios.get(url).then((resp): PokemonType[] | GpokeError => {
    if (!resp?.data?.results) {
      return {
        message: 'No pokemon types found'
      }
    }
    return resp?.data?.results
  }).catch((error): GpokeError => {
    console.log('we messed up')
    // catch error here
    return {
      message: 'Fetch error'
    }
  })
}

// same as gpoke but try/catch instead of then.catch
const gpe = async (): Promise<PokemonType[] | GpokeError> => {
  try {
    const resp = await axios.get(url);
    return resp?.data?.results ?? []
  } catch (e) {
    return {
      message: 'Errors'
    }

  }

}

const gnspoke = async (): Promise<PokemonType[]> => {
  const ptypes = await gpe();

  if (!(ptypes instanceof Array)) {
    console.log('handling error')
    return []
  }
  return sortPokemonTypes(ptypes)
}



const gPokemon = async (): Promise<ApiResponse> => {
  try {
    return await axios.get(url);
  } catch (error) {
    return {
      message: error.message,
      status: error.response.status,
    }
  }
}

const gnsPokemon = async (): Promise<PokemonType[] | string> => {
  const response = await gPokemon();
  const pTypes = response?.data?.results;

  if (!pTypes || (pTypes instanceof Array && pTypes.length === 0)) {
    return response?.message ?? 'An unknown error occurred'
  }

  return sortPokemonTypes(pTypes)
}

const getPokemon = async (): Promise<ApiResponse> => {
  try {
    return await axios.get(url)
  } catch (error) {
    return {
      message: error.message,
      status: error.response.status,
      data: { results: [] }
    }
  }
}

const getAndSortPokemon = async (): Promise<PokemonType[] | string> => {
  const pokeTypes = await getPokemon()
  if (pokeTypes.status === 200) {
    return sortPokemonTypes(pokeTypes?.data?.results)
  }

  return pokeTypes?.message
}

const sortPokemonTypes = (pokemonTypes: PokemonType[]): PokemonType[] => {
  if (!pokemonTypes) return [];

  return pokemonTypes.sort((a: any, b: any) => a.name.localeCompare(b.name))
}

// const findFirstAndThirdToLastPokemonType = async (): Promise<PokemonTypeByLocation> => {
//   const pokemonTypes = await getPokemon()
//   const result = { third: '' }
//   if (pokemonTypes.length < 2) {

//   }

//   if (pokemonTypes.length > 2) {
//     const pokeType = pokemonTypes[pokemonTypes.length - 3]
//     result['thirdToLast'] = pokeType?.url
//   }

//   if (pokemonTypes.length > 0) {
//     const pokeType = pokemonTypes[0]
//     result.third = pokeType?.url
//   }

//   return result
// }

void async function main() {
  const firstAndThirdToLast = await gnspoke()
  console.log(firstAndThirdToLast)
}()

// 1. Get a list of the types of Pokemon
// function returns an array of pokemon type objects. 

// 2. Sort the list of types alphabetically by type
// function returns pokemon types sorted by name 

// 3. Identify the url endpoints for the third and third-to-last types of Pokemon
// function returns an object with the third and third to last urls for a sorted list of Pokemon types.

// API notes:
// 'https://pokeapi.co/api/v2/type';
// returns an object with an attribute called 'results'. 'results' contains a list of pokemon types. each type contains a 'name' and 'url' attribute. 
