import React, { createContext, useState, useContext } from 'react';
import {getHighestRole, Role} from "../utils/role";
import {useUserContext} from "./UserContext";

const RoleContext = createContext();

export const RoleProvider = ({ children }) => {
  const { user } = useUserContext();
  const [role, setRole] = useState(getHighestRole(user));

  return (
    <RoleContext.Provider value={{ role, setRole }}>
      {children}
    </RoleContext.Provider>
  );
};

export const useRole = () => {
  const context = useContext(RoleContext);
  if (context === undefined) {
    throw new Error('useRole must be used within a RoleProvider');
  }
  return context;
};
