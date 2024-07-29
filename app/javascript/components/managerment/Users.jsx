import React, { Suspense, useState } from "react";
import { Card, FloatingLabel, Pagination, Table } from "flowbite-react";
import { useQuery, useSuspenseQuery } from "@tanstack/react-query";
import { getUsersByAdmin } from "../../api/admin/users";
import useDebounce from "../../hooks/useDebounce";

const UserHeader = () => {
  return (
    <Table.Head>
      <Table.HeadCell>Id</Table.HeadCell>
      <Table.HeadCell>Email</Table.HeadCell>
      <Table.HeadCell>Roles</Table.HeadCell>
      <Table.HeadCell>
        <span className="sr-only">Edit</span>
      </Table.HeadCell>
    </Table.Head>
  );
};

const UserRow = ({ user }) => {
  return (
    <Table.Row className="bg-white dark:border-gray-700 dark:bg-gray-800">
      <Table.Cell className="whitespace-nowrap font-medium text-gray-900 dark:text-white">
        {user.id}
      </Table.Cell>
      <Table.Cell>{user.email}</Table.Cell>
      <Table.Cell>{user.roles.join(", ")}</Table.Cell>
      <Table.Cell>
        <a
          href="#"
          className="font-medium text-cyan-600 hover:underline dark:text-cyan-500"
        >
          Edit
        </a>
      </Table.Cell>
    </Table.Row>
  );
};

const UserTableContent = ({ currentPage, searchParams, setTotalPages }) => {
  const {
    data: { users, pages },
  } = useSuspenseQuery({
    queryKey: [
      "admin_users",
      { page: currentPage, searchParams: searchParams },
    ],
    queryFn: getUsersByAdmin,
  });

  React.useEffect(() => {
    setTotalPages(pages.totalPages);
  }, [pages.totalPages, setTotalPages]);

  return (
    <Table.Body>
      {users.map((user) => {
        return <UserRow user={user} key={user.id} />;
      })}
    </Table.Body>
  );
};

const Placeholder = () => {
  return (
    <Table.Body>
      {React.Children.toArray(
        [...Array(10)].map((value) => {
          return (
            <Table.Row
              key={value}
              className="bg-white dark:border-gray-700 dark:bg-gray-800 shadow animate-pulse"
            >
              <Table.Cell className="whitespace-nowrap font-medium text-gray-900 dark:text-white">
                <div className="h-2.5 bg-gray-300 rounded-full dark:bg-gray-600 w-24 mb-2.5"></div>
              </Table.Cell>
              <Table.Cell>
                <div className="h-2.5 bg-gray-300 rounded-full dark:bg-gray-600 w-24 mb-2.5"></div>
              </Table.Cell>
              <Table.Cell>
                <div className="h-2.5 bg-gray-300 rounded-full dark:bg-gray-600 w-24 mb-2.5"></div>
              </Table.Cell>
              <Table.Cell>
                <div className="h-2.5 bg-gray-300 rounded-full dark:bg-gray-700 w-12"></div>
              </Table.Cell>
            </Table.Row>
          );
        }),
      )}
    </Table.Body>
  );
};

export default function UserPages() {
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [searchParams, setSearchParams] = useState({ email: "" });
  const debounceSearchParams = useDebounce(searchParams, 300);

  const onPageChange = (page) => setCurrentPage(page);

  return (
    <div>
      <div>
        <FloatingLabel
          variant="outlined"
          label="Search"
          value={searchParams.email}
          onChange={(e) =>
            setSearchParams((params) => ({ ...params, email: e.target.value }))
          }
        />
      </div>
      <div className="overflow-x-auto">
        <Table>
          <UserHeader />
          <Suspense fallback={<Placeholder />}>
            <UserTableContent
              currentPage={currentPage}
              setTotalPages={setTotalPages}
              searchParams={debounceSearchParams}
            />
          </Suspense>
        </Table>
      </div>

      <div className="flex overflow-x-auto sm:justify-center">
        <Pagination
          currentPage={currentPage}
          totalPages={totalPages}
          onPageChange={onPageChange}
        />
      </div>
    </div>
  );
}
