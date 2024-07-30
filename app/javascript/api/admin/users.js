import { makeHttpClient, parseCollection } from "@api/factory";
import { getPageFromHeaders } from "@api/pagy";

const { getJSON } = makeHttpClient({
  baseUrl: "/api/admin/users",
});

export const getUsersByAdmin = async ({ queryKey }) => {
  const { page, searchParams, sortParams } = queryKey[1] || {
    page: 1,
    searchParams: { email: "" },
    sortParams: {
      id: "asc",
    },
  };
  const q = searchParams.email ? `q[email_cont]=${searchParams.email}` : "";
  const s = sortParams.id ? `q[s]=id+${sortParams.id}` : "";
  const {
    data: { data },
    headers,
  } = await getJSON(`?${q}&${s}&page=${page}`);

  return {
    users: parseCollection(data),
    pages: getPageFromHeaders(headers),
  };
};
