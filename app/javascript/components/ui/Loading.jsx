import React from "react";
import { Spinner } from "flowbite-react";
import { cn } from "../../utils";

export function LoadingScreen({ className }) {
  return (
    <div
      className={cn(
        "w-full h-full flex justify-center items-center dark:bg-gray-900",
        className,
      )}
    >
      <Spinner aria-label="Spinner button example" size="xl" />
    </div>
  );
}
