import React, {createContext, useState, useContext, useEffect} from 'react';
import {getMe} from "../api/me";
import {LoadingPage} from "./ui/Loading";
import {useQuery} from "@tanstack/react-query";
import {getHighestRole} from "../utils/role";

const UserContext = createContext();

export const UserProvider = ({ children }) => {
  const result = useQuery({
    queryKey: ["getMe"],
    queryFn: getMe,
  });

  const [user, _] = useState(result.data);
  const [role, setRole] = useState(getHighestRole(user))

  if (result.isLoading) {
    return <LoadingPage />
  }

  if (result.isSuccess) {
    return (
      <UserContext.Provider value={{ user, role, setRole }}>
        { children }
      </UserContext.Provider>
    );
  }

  return <div>Error</div>
};

export const useUserContext = () => {
  const context = useContext(UserContext);
  if (context === undefined) {
    throw new Error('useUserContext must be used within a UserProvider');
  }
  return context;
};
