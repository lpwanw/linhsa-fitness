import axios from "axios";

const csrfToken = document.querySelector("meta[name='csrf-token']")

export const makeHttpClient = ({baseUrl}) => {
  const configs = {
    baseUrl: baseUrl,
    headers: {
      "X-Requested-With": "XMLHttpRequest",
      "Content-Type": "application/json",
      "X-CSRF-Token": csrfToken && csrfToken.content,
    }
  }

  const client = axios.create(configs)

  client.interceptors.response.use(
    response => response,
    error => {
      try {
        const responseMessage = error.response.data.message;
        console.log("Error!!!")

        if (error.response.status === 403 || error.response.status === 401) {
          window.location = '/users/sign_in';
        }
      } catch (e) {
        console.log("Error")
      }
      return Promise.reject(error);
    },
  );

  const getJSON = (url, data = {}, options = {}) => client.get(`${baseUrl}/${url}`, { ...options, params: data });

  return {
    getJSON,
  };
}
