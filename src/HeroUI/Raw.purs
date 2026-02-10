module HeroUI.Raw where

import React.Basic (ReactComponent)

-- Provider
foreign import heroUIProvider :: forall r. ReactComponent { | r }

-- Accordion
foreign import accordion :: forall r. ReactComponent { | r }
foreign import accordionItem :: forall r. ReactComponent { | r }

-- Alert
foreign import alert :: forall r. ReactComponent { | r }

-- Autocomplete
foreign import autocomplete :: forall r. ReactComponent { | r }
foreign import autocompleteItem :: forall r. ReactComponent { | r }
foreign import autocompleteSection :: forall r. ReactComponent { | r }

-- Avatar
foreign import avatar :: forall r. ReactComponent { | r }
foreign import avatarGroup :: forall r. ReactComponent { | r }

-- Badge
foreign import badge :: forall r. ReactComponent { | r }

-- Breadcrumbs
foreign import breadcrumbs :: forall r. ReactComponent { | r }
foreign import breadcrumbItem :: forall r. ReactComponent { | r }

-- Button
foreign import button :: forall r. ReactComponent { | r }
foreign import buttonGroup :: forall r. ReactComponent { | r }

-- Calendar
foreign import calendar :: forall r. ReactComponent { | r }
foreign import rangeCalendar :: forall r. ReactComponent { | r }

-- Card
foreign import card :: forall r. ReactComponent { | r }
foreign import cardHeader :: forall r. ReactComponent { | r }
foreign import cardBody :: forall r. ReactComponent { | r }
foreign import cardFooter :: forall r. ReactComponent { | r }

-- Checkbox
foreign import checkbox :: forall r. ReactComponent { | r }
foreign import checkboxGroup :: forall r. ReactComponent { | r }

-- Chip
foreign import chip :: forall r. ReactComponent { | r }

-- CircularProgress
foreign import circularProgress :: forall r. ReactComponent { | r }

-- Code
foreign import code :: forall r. ReactComponent { | r }

-- DateInput
foreign import dateInput :: forall r. ReactComponent { | r }
foreign import timeInput :: forall r. ReactComponent { | r }

-- DatePicker
foreign import datePicker :: forall r. ReactComponent { | r }
foreign import dateRangePicker :: forall r. ReactComponent { | r }

-- Divider
foreign import divider :: forall r. ReactComponent { | r }

-- Drawer
foreign import drawer :: forall r. ReactComponent { | r }
foreign import drawerContent :: forall r. ReactComponent { | r }
foreign import drawerHeader :: forall r. ReactComponent { | r }
foreign import drawerBody :: forall r. ReactComponent { | r }
foreign import drawerFooter :: forall r. ReactComponent { | r }

-- Dropdown
foreign import dropdown :: forall r. ReactComponent { | r }
foreign import dropdownTrigger :: forall r. ReactComponent { | r }
foreign import dropdownMenu :: forall r. ReactComponent { | r }
foreign import dropdownSection :: forall r. ReactComponent { | r }
foreign import dropdownItem :: forall r. ReactComponent { | r }

-- Form
foreign import form :: forall r. ReactComponent { | r }

-- Image
foreign import image :: forall r. ReactComponent { | r }

-- Input
foreign import input :: forall r. ReactComponent { | r }
foreign import textarea :: forall r. ReactComponent { | r }

-- InputOTP
foreign import inputOtp :: forall r. ReactComponent { | r }

-- Kbd
foreign import kbd :: forall r. ReactComponent { | r }

-- Link
foreign import link :: forall r. ReactComponent { | r }

-- Listbox
foreign import listbox :: forall r. ReactComponent { | r }
foreign import listboxSection :: forall r. ReactComponent { | r }
foreign import listboxItem :: forall r. ReactComponent { | r }

-- Modal
foreign import modal :: forall r. ReactComponent { | r }
foreign import modalContent :: forall r. ReactComponent { | r }
foreign import modalHeader :: forall r. ReactComponent { | r }
foreign import modalBody :: forall r. ReactComponent { | r }
foreign import modalFooter :: forall r. ReactComponent { | r }

-- Navbar
foreign import navbar :: forall r. ReactComponent { | r }
foreign import navbarBrand :: forall r. ReactComponent { | r }
foreign import navbarContent :: forall r. ReactComponent { | r }
foreign import navbarItem :: forall r. ReactComponent { | r }
foreign import navbarMenuToggle :: forall r. ReactComponent { | r }
foreign import navbarMenu :: forall r. ReactComponent { | r }
foreign import navbarMenuItem :: forall r. ReactComponent { | r }

-- NumberInput
foreign import numberInput :: forall r. ReactComponent { | r }

-- Pagination
foreign import pagination :: forall r. ReactComponent { | r }
foreign import paginationItem :: forall r. ReactComponent { | r }
foreign import paginationCursor :: forall r. ReactComponent { | r }

-- Popover
foreign import popover :: forall r. ReactComponent { | r }
foreign import popoverTrigger :: forall r. ReactComponent { | r }
foreign import popoverContent :: forall r. ReactComponent { | r }

-- Progress
foreign import progress :: forall r. ReactComponent { | r }

-- Radio
foreign import radio :: forall r. ReactComponent { | r }
foreign import radioGroup :: forall r. ReactComponent { | r }

-- Ripple
foreign import ripple :: forall r. ReactComponent { | r }

-- ScrollShadow
foreign import scrollShadow :: forall r. ReactComponent { | r }

-- Select
foreign import select :: forall r. ReactComponent { | r }
foreign import selectItem :: forall r. ReactComponent { | r }
foreign import selectSection :: forall r. ReactComponent { | r }

-- Skeleton
foreign import skeleton :: forall r. ReactComponent { | r }

-- Slider
foreign import slider :: forall r. ReactComponent { | r }

-- Snippet
foreign import snippet :: forall r. ReactComponent { | r }

-- Spacer
foreign import spacer :: forall r. ReactComponent { | r }

-- Spinner
foreign import spinner :: forall r. ReactComponent { | r }

-- Switch
foreign import switch_ :: forall r. ReactComponent { | r }

-- Table
foreign import table :: forall r. ReactComponent { | r }
foreign import tableHeader :: forall r. ReactComponent { | r }
foreign import tableColumn :: forall r. ReactComponent { | r }
foreign import tableBody :: forall r. ReactComponent { | r }
foreign import tableRow :: forall r. ReactComponent { | r }
foreign import tableCell :: forall r. ReactComponent { | r }

-- Tabs
foreign import tabs :: forall r. ReactComponent { | r }
foreign import tab :: forall r. ReactComponent { | r }

-- Toast
foreign import toast :: forall r. ReactComponent { | r }
foreign import toastProvider :: forall r. ReactComponent { | r }

-- Tooltip
foreign import tooltip :: forall r. ReactComponent { | r }

-- User
foreign import user :: forall r. ReactComponent { | r }
