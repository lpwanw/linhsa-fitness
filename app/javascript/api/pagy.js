export function getPageFromHeaders(headers) {
  return {
    count: +headers["page-items"],
    totalCount: +headers["total-count"],
    totalPages: +headers["total-pages"],
    currentPage: +headers["current_page"]
  }
}
