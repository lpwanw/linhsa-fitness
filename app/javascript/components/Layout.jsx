import React, {useState} from 'react';
import { Outlet } from 'react-router-dom';
import Sidebar from "./ui/Sidebar";
import Topbar from "./ui/Topbar";

const Layout = () => {
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);

  const handleSidebarClose = () => setIsSidebarOpen(false);

  return (
    <div className="flex flex-col">
      <Topbar onSidebarOpen={() => setIsSidebarOpen(true) }/>
      <div className="flex w-full">

        <Sidebar open={isSidebarOpen} onClose={handleSidebarClose}/>
        <main className="grow p-4">
          <Outlet />
        </main>
      </div>
    </div>
  );
};

export default Layout;
