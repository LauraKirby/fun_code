const axios = require("axios");

const userList = [
  {
    name: "First",
    birth_date: "1997-05-22 03:45",
    email: "first@primer.me"
  },
  {
    name: "Second",
    birth_date: "1992-04-22 03:45",
    email: "second@primer.me"
  },
  {
    name: "Third",
    birth_date: "1987-05-22 03:45",
    email: "third@primer.me"
  },
  {
    name: "Fourth",
    birth_date: "1980-05-22 03:45",
    email: "fourth@primer.me"
  },
  {
    name: "Fifth",
    birth_date: "1999-05-27 03:45",
    email: "fifth@primer.me"
  },
  {
    name: "Sixth",
    birth_date: "1964-05-22 03:45",
    email: "sixth@primer.me"
  }
];

const getUserAge = async (id) => {
  try {
    const data = await axios.get(
      "https://primer-test-api.vercel.app/user/1/age"
    );
    const test = await axios.post(
      "https://primer-test-api.vercel.app/user",
      {
        name: "MyName",
        birth_date: "1997-05-22 03:45",
        email: "namexyz1@primer.me"
      }
    );
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
  let successAndFail = await createUsers(users)
  let limitRetry = 50

  console.log('successAndFail.fail?.length: ', successAndFail.fail?.length)
  while (successAndFail.fail?.length > 0 && limitRetry > 0) {
    console.log('retrying: ', limitRetry)
    successAndFail = await createUsers(successAndFail.fail)

    limitRetry--
  }
}

// createUsers, simiple API endpoint 
// createUsersWithRetry, would call createUsers and include retry logic
// registerUsers, call createUsersWithRetry
// Axios interfaces for error handling 
const createUsers = async (users) => {
  const registeredUsers = { success: [], fail: [] }
  for (const user in users) {
    try {
      const response = await axios.post(
        "https://primer-test-api.vercel.app/user",
        {
          name: "MyName",
          birth_date: "1997-05-22 03:45",
          email: "namexyz1@primer.me"
        }
      );
      registeredUsers.success.push(user)
      console.log('user created: ', response.data)

    } catch (err) {
      registeredUsers.fail.push(user)

    }
  }
  return registeredUsers
}

void async function main() {
  await registerUsers(userList)
}()


// getUserAge(3);
// The API is very unstable.
