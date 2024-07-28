import React from "react";
import {Button, Dropdown} from "flowbite-react";
import {Role} from "../../utils/role";
import {cn} from "../../utils";
import {useTranslation} from "react-i18next";
import {IoIosArrowDown} from "react-icons/io";
import i18n from "i18next";
import { US, VN } from "country-flag-icons/react/3x2"

export default ({className}) => {
  const changeLanguage = (lng) => {
    i18n.changeLanguage(lng);
  }
  const { t } = useTranslation('language');
  const langFlags = () => {
    switch (i18n.language) {
      case "en": {
        return <US className="h-5"/>
      }
      case "vi": {
        return <VN className="h-5" />
      }
    }
  }

  const trigger = () => {
    return(
      <Button outline gradientDuoTone="pinkToOrange" className="w-full">
        <div className="flex justify-around w-full">
          {t(i18n.language)}
          {langFlags()}
        </div>
      </Button>
    )
  }

  return (
    <div className={cn("w-full flex justify-center items-center px-4 pt-2", className)}>
      <Dropdown label={""} renderTrigger={trigger} >
        <Dropdown.Item className="justify-around" onClick={() => changeLanguage("en")}>
          {t("en")}
          <US className="h-5"/>
        </Dropdown.Item>
        <Dropdown.Item className="justify-around" onClick={() => changeLanguage("vi")}>
          {t("vi")}
          <VN className="h-5"/>
        </Dropdown.Item>
      </Dropdown>
    </div>
  );
}
