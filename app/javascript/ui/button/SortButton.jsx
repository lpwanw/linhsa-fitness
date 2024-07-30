import React from "react";
import { FaArrowDownShortWide, FaArrowDownWideShort } from "react-icons/fa6";

export default function SortButton({ direction, onClick, children }) {
  return (
    <div onClick={onClick} className="flex gap-1 items-center cursor-pointer">
      {children}
      {direction === "asc" ? (
        <FaArrowDownShortWide />
      ) : (
        <FaArrowDownWideShort />
      )}
    </div>
  );
}
