export const Role = {
  admin: "admin",
  member: "member",
  teacher: "teacher",
};

export const UserRole = [Role.admin, Role.teacher, Role.member];

export const getHighestRole = (user) => {
  if (!user) {
    return Role.member;
  }
  const role = UserRole.find((role) => {
    return user.roles.includes(role);
  });

  return role || Role.member;
};
