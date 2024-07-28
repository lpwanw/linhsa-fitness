export const Role = {
  admin: "admin",
  member: "member",
  teacher: "teacher",
}

export const getHighestRole = (user) => {
  if (!user) {
    return Role.member
  }

  const role =  [Role.admin, Role.member, Role.member].find((role) => {
    return user.roles.includes(role)
  })

  return role || Role.member
}
