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
  data: ResponseData,
  message: string,
  error?: string,
}

interface ApiError {
  message: string
  status: number
  data: ResponseData,
}

const getPokemon = async (): Promise<ApiResponse | ApiError> => {
  try {
    const response = await axios.get(url)
    response.message = "success"
    return response
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

const findFirstAndThirdToLastPokemonType = async (): Promise<PokemonTypeByLocation> => {
  const pokemonTypes = await getPokemon()
  const result = { third: '' }
  if (pokemonTypes.length < 2) {

  }

  if (pokemonTypes.length > 2) {
    const pokeType = pokemonTypes[pokemonTypes.length - 3]
    result['thirdToLast'] = pokeType?.url
  }

  if (pokemonTypes.length > 0) {
    const pokeType = pokemonTypes[0]
    result.third = pokeType?.url
  }

  return result
}

void async function main() {
  const firstAndThirdToLast = await findFirstAndThirdToLastPokemonType()
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
