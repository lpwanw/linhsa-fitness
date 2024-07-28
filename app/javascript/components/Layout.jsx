import React, {useState} from 'react';
import {Outlet} from 'react-router-dom';
import Sidebar from "./ui/Sidebar";
import Topbar from "./ui/Topbar";
import RoleDropdown from "./ui/RoleDropdown";
import {RoleProvider} from "./context";
import {I18nextProvider} from "react-i18next";
import i18n from "../utils/i18n";

const Layout = () => {
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);

  const handleSidebarClose = () => setIsSidebarOpen(false);

  return (
    <I18nextProvider i18n={i18n}>
      <RoleProvider>
        <div className="flex h-screen flex-col bg-white dark:bg-gray-900">
          <Topbar onSidebarOpen={() => setIsSidebarOpen(true)}/>
          <div className="flex w-full">
            <div>
              <Sidebar open={isSidebarOpen} onClose={handleSidebarClose}/>
            </div>
            <main className="grow p-4">
              <Outlet/>
            </main>
          </div>
        </div>
      </RoleProvider>
    </I18nextProvider>
  );
};

export default Layout;
