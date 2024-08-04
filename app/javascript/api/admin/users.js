import { makeHttpClient, parseCollection } from "@api/factory";
import { getPageFromHeaders } from "@api/pagy";

const { getJSON } = makeHttpClient({
  baseUrl: "/api/admin/users",
});

export const getUsersByAdmin = async ({ queryKey }) => {
  const { page, searchParams, sortParams } = queryKey[1] || {
    page: 1,
    searchParams: { email: "", roles: [] },
    sortParams: {
      id: "asc",
    },
  };
  const params = {
    "q[email_cont]": searchParams.email || "",
    "q[roles_name_in]": searchParams.roles,
    "q[s]": "id " + (sortParams.id || ""),
    page: page,
  };
  const {
    data: { data },
    headers,
  } = await getJSON("", params);

  return {
    users: parseCollection(data),
    pages: getPageFromHeaders(headers),
  };
};
