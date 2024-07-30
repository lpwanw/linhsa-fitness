import React, { lazy } from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "@pages/Home";
import Layout from "@pages/Layout";
import NotFound from "./NotFound";

const Users = lazy(() => import("@pages/management/Users"));

export default (
  <Router basename={"/app"}>
    <Routes>
      <Route path="/" element={<Layout />}>
        <Route index element={<Home />} />
        <Route path="/management/users" element={<Users />} />
        <Route path="*" element={<NotFound />} />
      </Route>
    </Routes>
  </Router>
);
