import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "../components/Home";
import Layout from "../components/Layout";

export default (
  <Router basename={"/app"}>
    <Routes>
      <Route path="/" element={<Layout />} >
        <Route index element={<Home />} />
      </Route>
    </Routes>
  </Router>
);
