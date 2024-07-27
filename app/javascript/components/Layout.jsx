import React from 'react';
import { Outlet } from 'react-router-dom';

const Layout = () => {
  return (
    <div className="flex w-full">
      <main className="grow">
        <Outlet />
      </main>
    </div>
  );
};

export default Layout;
