import {
  useAccordion,
  useAccordionItem,
  useAutocomplete,
  useCheckbox,
  useCheckboxGroup,
  useDisclosure,
  useDraggable,
  useDrawer,
  useDropdown,
  useModal,
  usePopover,
  useSelect,
  useTabs,
} from "@heroui/react";

const hook = (h) => (props) => h(props);

export const useDisclosureImpl = hook(useDisclosure);
export const useModalImpl = hook(useModal);
export const useDraggableImpl = hook(useDraggable);
export const useDrawerImpl = hook(useDrawer);
export const usePopoverImpl = hook(usePopover);
export const useDropdownImpl = hook(useDropdown);
export const useSelectImpl = hook(useSelect);
export const useAutocompleteImpl = hook(useAutocomplete);
export const useTabsImpl = hook(useTabs);
export const useAccordionImpl = hook(useAccordion);
export const useAccordionItemImpl = hook(useAccordionItem);
export const useCheckboxImpl = hook(useCheckbox);
export const useCheckboxGroupImpl = hook(useCheckboxGroup);
