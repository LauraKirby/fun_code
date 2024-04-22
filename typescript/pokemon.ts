"use strict";
const url = "https://pokeapi.co/api/v2/type";
// const axios = require('axios');
import axios, { AxiosResponse } from "axios";

enum ApiResponseCondition {
  fail = "fail",
  success = "success",
}

interface PokemonType {
  name: string;
  url: string;
}

interface PokemonTypeByLocation {
  third?: string;
  thirdToLast?: string;
}

interface ApiError {
  code: string;
  condition: ApiResponseCondition.fail;
  message: string;
}
interface ResponseData {
  results: PokemonType[];
}

interface ApiResponse {
  condition: ApiResponseCondition.success;
  data: ResponseData;
  status: number;
}

const getPokemon = async (): Promise<ApiResponse | ApiError> => {
  try {
    const response: AxiosResponse = await axios.get(url);

    return {
      status: response?.status,
      data: response?.data,
      condition: ApiResponseCondition.success,
    };
  } catch (error) {
    const errorMessage = "unknown error when trying to fetch pokemon types";
    const errorCode = "UNKNOWN";

    return {
      code: error?.code ?? errorCode,
      message: errorMessage,
      condition: ApiResponseCondition.fail,
    };
  }
};

const getAndSortPokemon = async (): Promise<PokemonType[]> => {
  const pokeTypes = await getPokemon();

  if (pokeTypes.condition !== ApiResponseCondition.success) return [];

  return sortPokemonTypes(pokeTypes?.data?.results);
};

const sortPokemonTypes = (pokemonTypes: PokemonType[]): PokemonType[] => {
  if (!pokemonTypes) return [];

  return pokemonTypes.sort((a: any, b: any) => a.name.localeCompare(b.name));
};

const findThirdAndThirdToLastPokemonType =
  async (): Promise<PokemonTypeByLocation> => {
    const pokemonTypes = await getAndSortPokemon();
    const result = { third: "", thirdToLast: "" };
    if (pokemonTypes.length > 2) {
      result.third = pokemonTypes[2].url;
      result.thirdToLast = pokemonTypes[pokemonTypes.length - 3].url;
    }

    return result;
  };

void (async function main() {
  const thirdAndThirdToLast = await findThirdAndThirdToLastPokemonType();
  console.log(thirdAndThirdToLast);
})();

// 1. Get a list of the types of Pokemon
// function returns an array of pokemon type objects.

// 2. Sort the list of types alphabetically by type
// function returns pokemon types sorted by name

// 3. Identify the url endpoints for the third and third-to-last types of Pokemon
// function returns an object with the third and third to last urls for a sorted list of Pokemon types.

// API notes:
// 'https://pokeapi.co/api/v2/type';
// returns an object with an attribute called 'results'. 'results' contains a list of pokemon types. each type contains a 'name' and 'url' attribute.

// in house caching
// audience takes over an hour to build

const axios = require("axios");

const userList = [
  {
    name: "First",
    birth_date: "1997-05-22 03:45",
    email: "first@primer.me",
  },
  {
    name: "Second",
    birth_date: "1992-04-22 03:45",
    email: "second@primer.me",
  },
  {
    name: "Third",
    birth_date: "1987-05-22 03:45",
    email: "third@primer.me",
  },
  {
    name: "Fourth",
    birth_date: "1980-05-22 03:45",
    email: "fourth@primer.me",
  },
  {
    name: "Fifth",
    birth_date: "1999-05-27 03:45",
    email: "fifth@primer.me",
  },
  {
    name: "Sixth",
    birth_date: "1964-05-22 03:45",
    email: "sixth@primer.me",
  },
];

const getUserAge = async (id) => {
  try {
    const data = await axios.get(
      "https://primer-test-api.vercel.app/user/1/age"
    );
    const test = await axios.post("https://primer-test-api.vercel.app/user", {
      name: "MyName",
      birth_date: "1997-05-22 03:45",
      email: "namexyz1@primer.me",
    });
  } catch (e) {
    console.log(e);
  }
};

// registerUsers
// iterate through userList
// POST to create each user
// if error code (could be 4XX or 5XX)
// retry these users

const registerUsers = async (users) => {
  let successAndFail = await createUsers(users);
  let limitRetry = 50;

  console.log("successAndFail.fail?.length: ", successAndFail.fail?.length);
  while (successAndFail.fail?.length > 0 && limitRetry > 0) {
    console.log("retrying: ", limitRetry);
    successAndFail = await createUsers(successAndFail.fail);

    limitRetry--;
  }
};

// createUsers, simiple API endpoint
// createUsersWithRetry, would call createUsers and include retry logic
// registerUsers, call createUsersWithRetry
// Axios interfaces for error handling
const createUsers = async (users) => {
  const registeredUsers = { success: [], fail: [] };
  for (const user in users) {
    try {
      const response = await axios.post(
        "https://primer-test-api.vercel.app/user",
        {
          name: "MyName",
          birth_date: "1997-05-22 03:45",
          email: "namexyz1@primer.me",
        }
      );
      registeredUsers.success.push(user);
      console.log("user created: ", response.data);
    } catch (err) {
      registeredUsers.fail.push(user);
    }
  }
  return registeredUsers;
};

void (async function main() {
  await registerUsers(userList);
})();

// getUserAge(3);
// The API is very unstable.
