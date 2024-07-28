import React from "react";
import {HiArrowSmRight, HiChartPie, HiInbox, HiShoppingBag, HiTable, HiUser, HiViewBoards} from "react-icons/hi";
import {Drawer, Sidebar} from "flowbite-react";
import RoleDropdown from "./RoleDropdown";
import LanguageDropdown from "./LanguageDropdown";
import {Role} from "../../utils/role";
import {Link} from "react-router-dom";
import {useUserContext} from "../UserContext";

const AdminSidebarItems = () => {
  return (
    <>
      <Sidebar.Item icon={HiChartPie} as="div">
        <Link to="management/users">
          Management
        </Link>
      </Sidebar.Item>
    </>
  )
}

const SidebarContent = () => {
  const { role } = useUserContext();

  return(
    <>
      <LanguageDropdown />
      <RoleDropdown />
      <Sidebar className="h-full w-48 mt-2" aria-label="Default sidebar example">
        <Sidebar.Items >
          <Sidebar.ItemGroup className="rounded-none">
            { role === Role.admin ? <AdminSidebarItems /> : null}
          </Sidebar.ItemGroup>
        </Sidebar.Items>
      </Sidebar>
    </>
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
