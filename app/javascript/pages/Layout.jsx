import React, { Suspense, useState } from "react";
import { Outlet } from "react-router-dom";
import Sidebar from "@ui/Sidebar";
import Topbar from "@ui/Topbar";
import { I18nextProvider } from "react-i18next";
import i18n from "@utils/i18n";
import { UserProvider } from "@pages/UserContext";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { LoadingScreen } from "@ui/Loading";

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
      <Suspense fallback={<LoadingScreen className="h-screen w-screen" />}>
        <I18nextProvider i18n={i18n}>
          <UserProvider>
            <div className="flex h-screen flex-col bg-white dark:bg-gray-900">
              <Topbar onSidebarOpen={() => setIsSidebarOpen(true)} />
              <div className="flex w-full h-full">
                <Sidebar open={isSidebarOpen} onClose={handleSidebarClose} />

                <main className="grow p-4 overflow-y-auto">
                  <Suspense fallback={<LoadingScreen />}>
                    <Outlet />
                  </Suspense>
                </main>
              </div>
            </div>
          </UserProvider>
        </I18nextProvider>
      </Suspense>
    </QueryClientProvider>
  );
};

export default Layout;
