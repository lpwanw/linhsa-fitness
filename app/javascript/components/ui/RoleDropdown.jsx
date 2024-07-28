import React from "react";
import {Button, Dropdown} from "flowbite-react";
import {Role} from "../../utils/role";
import {IoIosArrowDown} from "react-icons/io";
import {cn} from "../../utils";
import {useTranslation} from "react-i18next";
import {useUserContext} from "../UserContext";

export default ({className}) => {
  const { user, role, setRole } = useUserContext();
  const { t } = useTranslation('role');

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
        {
          user.roles.map((role) => {
            return <Dropdown.Item key={role} onClick={() => setRole(role)}>{t(role)}</Dropdown.Item>
          })
        }
      </Dropdown>
    </div>
  );
}
