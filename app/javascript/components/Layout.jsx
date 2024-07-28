import React, {useState} from 'react';
import {Outlet} from 'react-router-dom';
import Sidebar from "./ui/Sidebar";
import Topbar from "./ui/Topbar";
import {I18nextProvider} from "react-i18next";
import i18n from "../utils/i18n";
import {UserProvider, useUserContext} from "./UserContext";
import {QueryClient, QueryClientProvider} from "@tanstack/react-query";

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 1000 * 60,
      cacheTime: 1000 * 60 * 5,
      suspense: true,
    },
  },
});


const Layout = () => {
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);
  const handleSidebarClose = () => setIsSidebarOpen(false);

  return (
    <QueryClientProvider client={queryClient}>
      <I18nextProvider i18n={i18n}>
        <UserProvider>
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
        </UserProvider>
      </I18nextProvider>
    </QueryClientProvider>
  );
};

export default Layout;
