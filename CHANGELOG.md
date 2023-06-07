2023-06-06

- When text is edited, the list box will scroll to the text insertion point
- New public method to scroll to the edit row's insertion point: TRCustomListBox(instance).ScrollToEditRowInsertionPoint()
- Refactored text metrics calculations
- New public method to get the edit row TRCustomListBox(instance).EditRow() as TRCustomListBoxRow 
- New public method to intuitively scroll to a content offset: TRProportionalDesktopScrollbar(instance)ScrollTo(value as Double, contentHeight as Double, visibleHeight as Double)
- Bug fixes


2023-06-03

- New demo: Chat Bubbles
- Add features to support new demo
- Internal refactorings

![Chat Bubbles Demo](assets/Chat%20Bubbles.png)


2023-06-02

- Improve positioning of text when entering edit mode


2023-06-01

- Initial Release