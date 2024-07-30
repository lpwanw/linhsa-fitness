import { makeHttpClient, parseData } from "./factory";

const { getJSON } = makeHttpClient({
  baseUrl: "/api",
});

export const getMe = async () => {
  const {
    data: { data },
  } = await getJSON("me");

  return parseData(data);
};
