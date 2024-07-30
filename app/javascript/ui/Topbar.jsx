import React from "react";

import { Avatar, DarkThemeToggle, Dropdown, Navbar } from "flowbite-react";
import { HiMenu } from "react-icons/hi";
import { Link } from "react-router-dom";
import { useUserContext } from "@pages/UserContext";

const handleSignOut = () => {
  document.getElementById("signout-form").submit();
};

export default ({ onSidebarOpen }) => {
  const { user } = useUserContext();

  return (
    <Navbar fluid className="border-b-2">
      <Link to="/">
        <Navbar.Brand as="div">
          <svg
            className="mr-3 h-6 w-6 sm:h-9 sm:w-9"
            width="250"
            height="250"
            viewBox="0 0 250 250"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <rect width="250" height="250" rx="48" fill="#F3AA4E" />
            <path
              d="M74.8509 111.945C83.8805 120.975 90.1914 130.737 93.199 139.076C96.3249 147.743 95.4526 153.406 92.8005 156.058C90.1485 158.71 84.486 159.582 75.8188 156.456C67.4797 153.449 57.7175 147.138 48.688 138.108C39.6584 129.079 33.3475 119.317 30.3399 110.977C27.214 102.31 28.0863 96.6477 30.7383 93.9957C33.3904 91.3436 39.0528 90.4713 47.7201 93.5972C56.0592 96.6048 65.8213 102.916 74.8509 111.945Z"
              stroke="#111820"
              strokeWidth="8"
            />
            <path
              d="M74.851 137.851C65.8214 146.88 56.0593 153.191 47.7201 156.199C39.0529 159.325 33.3904 158.453 30.7384 155.801C28.0863 153.149 27.214 147.486 30.3399 138.819C33.3475 130.48 39.6584 120.718 48.688 111.688C57.7176 102.658 67.4797 96.3475 75.8189 93.3399C84.4861 90.214 90.1486 91.0863 92.8006 93.7383C95.4526 96.3904 96.3249 102.053 93.199 110.72C90.1915 119.059 83.8805 128.821 74.851 137.851Z"
              stroke="#111820"
              strokeWidth="8"
            />
            <path
              d="M155.699 104.182V88.2727H218.909V104.182H197.034V161H177.574V104.182H155.699Z"
              fill="#111820"
            />
            <rect
              x="122"
              y="75"
              width="7"
              height="100"
              rx="3.5"
              fill="#111820"
            />
          </svg>

          <span className="self-center whitespace-nowrap text-xl font-semibold dark:text-white">
            LinhSa
          </span>
        </Navbar.Brand>
      </Link>

      <div className="flex md:order-2 gap-2">
        <Dropdown
          arrowIcon={false}
          inline
          label={
            <Avatar
              alt="User settings"
              img="https://flowbite.com/docs/images/people/profile-picture-5.jpg"
              rounded
            />
          }
        >
          <Dropdown.Header>
            <span className="block text-sm">Bonnie Green</span>
            <span className="block truncate text-sm font-medium">
              {user.email}
            </span>
          </Dropdown.Header>
          <Dropdown.Item>Dashboard</Dropdown.Item>
          <Dropdown.Item>Settings</Dropdown.Item>
          <Dropdown.Item>Earnings</Dropdown.Item>
          <Dropdown.Divider />
          <form
            id="signout-form"
            action="/users/sign_out"
            method="post"
            style={{ display: "none" }}
          >
            <input type="hidden" name="_method" value="delete" />
            <input
              type="hidden"
              name="authenticity_token"
              value={document.querySelector('meta[name="csrf-token"]').content}
            />
          </form>
          <Dropdown.Item onClick={handleSignOut}>Sign out</Dropdown.Item>
        </Dropdown>
        <DarkThemeToggle />
        <button
          type="button"
          onClick={onSidebarOpen}
          className="md:hidden rounded-lg p-2.5 text-sm text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-700"
        >
          <HiMenu className="h-5 w-5" />
          <span className="sr-only">Sidebar Toggle</span>
        </button>
      </div>
    </Navbar>
  );
};
