import React from "react"
import {Spinner} from "flowbite-react";

export function LoadingPage() {
  return (
    <div className="fixed top-0 left-0 w-screen h-screen z-[9999]">
      <Spinner aria-label="Spinner button example" size="sm" />
    </div>
  )
}
