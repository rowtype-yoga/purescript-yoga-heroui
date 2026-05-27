import { addToast, closeToast, closeAll } from "@heroui/react";

export const addToastImpl = (opts) => () => addToast(opts);
export const closeToastImpl = (id) => () => closeToast(id);
export const closeAllToastsImpl = () => closeAll();
