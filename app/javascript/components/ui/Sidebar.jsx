import React from "react";
import {HiArrowSmRight, HiChartPie, HiInbox, HiShoppingBag, HiTable, HiUser, HiViewBoards} from "react-icons/hi";
import {Drawer, Sidebar} from "flowbite-react";

const SidebarContent = () => {
  return(
    <Sidebar className="h-full" aria-label="Default sidebar example">
      <Sidebar.Items >
        <Sidebar.ItemGroup className="rounded-none">
          <Sidebar.Item href="#" icon={HiChartPie}>
            Dashboard
          </Sidebar.Item>
          <Sidebar.Item href="#" icon={HiViewBoards} label="Pro" labelColor="dark">
            Kanban
          </Sidebar.Item>
          <Sidebar.Item href="#" icon={HiInbox} label="3">
            Inbox
          </Sidebar.Item>
          <Sidebar.Item href="#" icon={HiUser}>
            Users
          </Sidebar.Item>
          <Sidebar.Item href="#" icon={HiShoppingBag}>
            Products
          </Sidebar.Item>
          <Sidebar.Item href="#" icon={HiArrowSmRight}>
            Sign In
          </Sidebar.Item>
          <Sidebar.Item href="#" icon={HiTable}>
            Sign Up
          </Sidebar.Item>
        </Sidebar.ItemGroup>
      </Sidebar.Items>
    </Sidebar>
  )
}

export default ({open, onClose}) => {
  return(
    <>
      <div className="hidden md:block">
        <SidebarContent />
      </div>

      <Drawer open={open} className="md:hidden" onClose={onClose} position="right">
        <Drawer.Header title="MENU" titleIcon={() => <></>} />
        <Drawer.Items>
          <SidebarContent />
        </Drawer.Items>
      </Drawer>
    </>
  )
}
