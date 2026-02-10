import React from "react";

export const createElementTransformImpl = (transforms, component, props, children) => {
  const transformed = { ...props };
  for (const key in transforms) {
    if (key in transformed) {
      transformed[key] = transforms[key](transformed[key]);
    }
  }
  if (typeof children === undefined || children == null || children.length === 0) return React.createElement(component, transformed);
  if (!Array.isArray(children)) return React.createElement(component, transformed, children);
  return React.createElement(component, transformed, ...children);
};
