import React from "react";
import { Drawer, Sidebar } from "flowbite-react";
import { Role } from "@utils/role";
import { Link } from "react-router-dom";
import { useUserContext } from "@pages/UserContext";
import { useTranslation } from "react-i18next";
import { CgToolbox } from "react-icons/cg";
import { FaUser } from "react-icons/fa";
import RoleDropdown from "@ui/dropdown/RoleDropdown";
import LanguageDropdown from "@ui/dropdown/LanguageDropdown";

const AdminSidebarItems = ({ onItemClick }) => {
  const { t } = useTranslation("sidebar");

  return (
    <>
      <Sidebar.Collapse icon={CgToolbox} label={t("Management")}>
        <Sidebar.Item as="div" icon={FaUser}>
          <Link to="/management/users" onClick={onItemClick}>
            {t("Users")}
          </Link>
        </Sidebar.Item>
      </Sidebar.Collapse>
    </>
  );
};

const SidebarContent = ({ onItemClick }) => {
  const { role } = useUserContext();

  return (
    <div className="h-full flex flex-col">
      <RoleDropdown />
      <Sidebar
        className="w-48 mt-2 h-fit grow overflow-y-auto"
        aria-label="Default sidebar example"
      >
        <Sidebar.Items>
          <Sidebar.ItemGroup className="rounded-none">
            {role === Role.admin ? (
              <AdminSidebarItems onItemClick={onItemClick} />
            ) : null}
          </Sidebar.ItemGroup>
        </Sidebar.Items>
      </Sidebar>
      <LanguageDropdown className={"mt-auto"} />
    </div>
  );
};

export default ({ open, onClose }) => {
  return (
    <>
      <div className="hidden md:block">
        <SidebarContent />
      </div>

      <Drawer
        open={open}
        className="md:hidden flex flex-col w-60"
        onClose={onClose}
        position="right"
      >
        <Drawer.Header title="MENU" titleIcon={() => <></>} />
        <Drawer.Items className="grow">
          <SidebarContent onItemClick={onClose} />
        </Drawer.Items>
      </Drawer>
    </>
  );
};
