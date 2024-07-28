import React from "react";
import {Button, Dropdown} from "flowbite-react";
import {Role} from "../../utils/role";
import {IoIosArrowDown} from "react-icons/io";
import {cn} from "../../utils";
import {useRole} from "../context";
import {useTranslation} from "react-i18next";

export default ({className}) => {
  const { t } = useTranslation('role');
  const { role, setRole } = useRole();

  const trigger = () => {
    return(
      <Button outline gradientDuoTone="pinkToOrange" className="w-full">
        <div className="flex justify-around w-full">
          {t(role)}
          <IoIosArrowDown className="h-5 w-5" />
        </div>
      </Button>
    )
  }

  return (
    <div className={cn("w-full flex justify-center items-center px-4 pt-2", className)}>
      <Dropdown label={""} renderTrigger={trigger} >
        <Dropdown.Item onClick={() => setRole(Role.admin)}>{t(Role.admin)}</Dropdown.Item>
        <Dropdown.Item onClick={() => setRole(Role.teacher)}>{t(Role.teacher)}</Dropdown.Item>
        <Dropdown.Item onClick={() => setRole(Role.member)}>{t(Role.member)}</Dropdown.Item>
      </Dropdown>
    </div>
  );
}
