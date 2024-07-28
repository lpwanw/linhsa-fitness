import React, {useState} from 'react';
import { Outlet } from 'react-router-dom';
import Sidebar from "./ui/Sidebar";
import Topbar from "./ui/Topbar";
import RoleDropdown from "./ui/RoleDropdown";
import {RoleProvider} from "./context";

const Layout = () => {
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);

  const handleSidebarClose = () => setIsSidebarOpen(false);

  return (
    <RoleProvider>
      <div className="flex h-screen flex-col bg-white dark:bg-gray-900">
        <Topbar onSidebarOpen={() => setIsSidebarOpen(true)}/>
        <div className="flex w-full">
          <div>
            <RoleDropdown className="hidden md:flex" />
            <Sidebar open={isSidebarOpen} onClose={handleSidebarClose}/>
          </div>
          <main className="grow p-4">
            <Outlet/>
          </main>
        </div>
      </div>
    </RoleProvider>
  );
};

export default Layout;
