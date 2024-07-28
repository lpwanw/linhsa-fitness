import React from "react";
import {Button, Dropdown} from "flowbite-react";
import {Role} from "../../utils/role";
import {IoIosArrowDown} from "react-icons/io";
import {cn} from "../../utils";
import {useRole} from "../context";

export default ({className}) => {
  const { role, setRole } = useRole();

  const trigger = () => {
    return(
      <Button outline gradientDuoTone="pinkToOrange" className="w-full">
        <div className="flex justify-around w-full">
          {role}
          <IoIosArrowDown className="h-5 w-5" />
        </div>
      </Button>
    )
  }

  return (
    <div className={cn("w-full flex justify-center items-center p-4", className)}>
      <Dropdown label={""} renderTrigger={trigger} >
        <Dropdown.Item onClick={() => setRole(Role.admin)}>Admin</Dropdown.Item>
        <Dropdown.Item onClick={() => setRole(Role.teacher)}>Teacher</Dropdown.Item>
        <Dropdown.Item onClick={() => setRole(Role.member)}>Member</Dropdown.Item>
      </Dropdown>
    </div>
  );
}
