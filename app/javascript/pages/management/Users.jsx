import React, { Children, Suspense, useEffect, useState } from "react";
import {
  Checkbox,
  Dropdown,
  FloatingLabel,
  Pagination,
  Table,
} from "flowbite-react";
import { useSuspenseQuery } from "@tanstack/react-query";
import { getUsersByAdmin } from "@api/admin/users";
import useDebounce from "@hooks/useDebounce";
import { useSearchParams } from "react-router-dom";
import SortButton from "@ui/button/SortButton";
import { UserRole } from "@utils/role";
import { HiFilter } from "react-icons/hi";
import { isEmpty } from "lodash";

const UserHeader = ({}) => {
  const [searchParams, setSearchParams] = useSearchParams();

  const sortId = searchParams.get("s[id]") || "asc";
  const roles = (searchParams.get("roles")?.split(",") || []).filter(
    (item) => !isEmpty(item),
  );
  const onSortClick = (attribute) => {
    setSearchParams((prev) => {
      const key = `s[${attribute}]`;
      const direction = searchParams.get(key) || "asc";
      prev.set(key, direction === "asc" ? "desc" : "asc");
      prev.set("page", 1);
      return prev;
    });
  };

  const onRoleFilterClick = (role) => {
    const index = roles.indexOf(role);
    if (index > -1) {
      roles.splice(index, 1);
    } else {
      roles.push(role);
    }

    setSearchParams((prev) => {
      prev.set("roles", roles.join(","));
      return prev;
    });
  };

  return (
    <Table.Head>
      <Table.HeadCell>
        <SortButton direction={sortId} onClick={() => onSortClick("id")}>
          Id
        </SortButton>
      </Table.HeadCell>
      <Table.HeadCell>Email</Table.HeadCell>
      <Table.HeadCell>
        <Dropdown
          label=""
          renderTrigger={() => {
            return (
              <div className="relative flex gap-0.5 justify-center items-center w-fit">
                <HiFilter className="mr-2 h-5 w-5" />
                Roles
                {isEmpty(roles) ? null : (
                  <div className="absolute inline-flex items-center justify-center w-5 h-5 text-xs text-white rounded-full top-1.2 start-2">
                    {roles.length}
                  </div>
                )}
              </div>
            );
          }}
        >
          {Children.toArray(
            UserRole.map((role) => {
              return (
                <Dropdown.Item className={"flex gap-2"}>
                  <Checkbox
                    onClick={() => onRoleFilterClick(role)}
                    checked={roles.includes(role)}
                  />
                  {role}
                </Dropdown.Item>
              );
            }),
          )}
        </Dropdown>
      </Table.HeadCell>
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

const UserTableContent = ({ setTotalPages }) => {
  const [searchParams, _] = useSearchParams();

  const apiSearchParams = {
    email: searchParams.get("email") || "",
    roles: (searchParams.get("roles") || "").split(","),
  };
  const sortParams = {
    id: searchParams.get("s[id]") || "asc",
  };

  const currentPage = parseInt(searchParams.get("page") || "1", 10);

  const {
    data: { users, pages },
  } = useSuspenseQuery({
    queryKey: [
      "admin_users",
      {
        page: currentPage,
        searchParams: apiSearchParams,
        sortParams: sortParams,
      },
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
  const [searchParams, setSearchParams] = useSearchParams();
  const [email, setEmail] = useState(searchParams.get("email") || "");

  const currentPage = parseInt(searchParams.get("page") || "1", 10);
  const [totalPages, setTotalPages] = useState(1);
  const debouncedEmail = useDebounce(email, 300);

  const onPageChange = (page) => {
    setSearchParams((prev) => {
      prev.set("page", page.toString());
      return prev;
    });
  };

  const onEmailChange = (e) => {
    setEmail(e.target.value);
  };

  useEffect(() => {
    setSearchParams((prev) => {
      if (debouncedEmail !== prev.get("email")) {
        prev.set("email", debouncedEmail);
        prev.set("page", 1);
      }
      return prev;
    });
  }, [debouncedEmail, setSearchParams]);

  return (
    <div>
      <div>
        <FloatingLabel
          variant="outlined"
          label="Search"
          value={email}
          onChange={onEmailChange}
        />
      </div>
      <div className="overflow-x-auto min-h-[564px]">
        <Table>
          <UserHeader />
          <Suspense fallback={<Placeholder />}>
            <UserTableContent setTotalPages={setTotalPages} />
          </Suspense>
        </Table>
      </div>

      <div className="flex overflow-x-auto sm:justify-center">
        <Pagination
          currentPage={currentPage}
          totalPages={totalPages}
          onPageChange={onPageChange}
          previousLabel=""
          nextLabel=""
          showIcons
        />
      </div>
    </div>
  );
}
