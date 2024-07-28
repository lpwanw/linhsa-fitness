import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "../components/Home";
import Layout from "../components/Layout";
import Users from "../components/managerment/Users"

export default (
  <Router basename={"/app"}>
    <Routes>
      <Route path="/" element={<Layout />}>
        <Route index element={<Home />} />
        <Route path="/management/users" element={<Users />} />
      </Route>
    </Routes>
  </Router>
);
