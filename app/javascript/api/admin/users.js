import { makeHttpClient } from "../factory";
import { getPageFromHeaders } from "../pagy";

const { getJSON } = makeHttpClient({
  baseUrl: "/api/admin/users",
});

export const getUsersByAdmin = async ({ queryKey }) => {
  const { page, searchParams } = queryKey[1] || {
    page: 1,
    searchParams: { email: "" },
  };
  const { email } = searchParams || { email: "" };
  const q = `q[email_cont]=${email}`;
  const { data, headers } = await getJSON(`?${q}&page=${page}`);

  return {
    users: data.data,
    pages: getPageFromHeaders(headers),
  };
};
