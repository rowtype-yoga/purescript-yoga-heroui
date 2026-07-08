export const standaloneToastRuntime = (title) => (description) => ({
  toast: {
    key: "standalone-toast-preview",
    timer: null,
    timeout: null,
    content: { title, description }
  },
  state: { close: () => undefined },
  heights: [],
  setHeights: () => undefined
});
