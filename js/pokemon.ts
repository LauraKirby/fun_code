"use strict";
const url = 'https://pokeapi.co/api/v2/type';
// const axios = require('axios');
import axios, { AxiosResponse } from 'axios';

enum ApiReponseCondition {
  fail = 'fail',
  success = 'success',
}

interface PokemonType {
  name: string
  url: string
}

interface PokemonTypeByLocation {
  third?: string
  thirdToLast?: string
}

interface ApiError {
  code: string
  condition: ApiReponseCondition.fail
  message: string
}
interface ResponseData {
  results: PokemonType[]
}

interface ApiResponse {
  condition: ApiReponseCondition.success
  data: ResponseData
  status: number
}

const getPokemon = async (): Promise<ApiResponse | ApiError> => {
  try {
    const response: AxiosResponse = await axios.get(url)

    return {
      status: response?.status,
      data: response?.data,
      condition: ApiReponseCondition.success
    }
  } catch (error) {
    const errorMessage = 'unknown error when trying to fetch pokemon types'
    const errorCode = 'UNKNOWN'

    return {
      code: error?.code ?? errorCode,
      message: errorMessage,
      condition: ApiReponseCondition.fail,
    }
  }
}

const getAndSortPokemon = async (): Promise<PokemonType[]> => {
  const pokeTypes = await getPokemon()

  if (pokeTypes.condition !== ApiReponseCondition.success) return [];

  return sortPokemonTypes(pokeTypes?.data?.results)
}

const sortPokemonTypes = (pokemonTypes: PokemonType[]): PokemonType[] => {
  if (!pokemonTypes) return [];

  return pokemonTypes.sort((a: any, b: any) => a.name.localeCompare(b.name))
}

const findThirdAndThirdToLastPokemonType = async (): Promise<PokemonTypeByLocation> => {
  const pokemonTypes = await getAndSortPokemon()
  const result = { third: '', thirdToLast: '' }
  if (pokemonTypes.length > 2) {
    result.third = pokemonTypes[2].url
    result.thirdToLast = pokemonTypes[pokemonTypes.length - 3].url
  }

  return result
}

void async function main() {
  const thirdAndThirdToLast = await findThirdAndThirdToLastPokemonType()
  console.log(thirdAndThirdToLast)
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
