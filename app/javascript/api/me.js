import { makeHttpClient } from "./factory";

const { getJSON } = makeHttpClient({
  baseUrl: "/api",
})

export const getMe = async () => {
  const  { data }= await getJSON("me");

  return data.data;
}
