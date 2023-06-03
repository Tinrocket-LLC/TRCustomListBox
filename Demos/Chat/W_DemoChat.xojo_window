#tag DesktopWindow
Begin DesktopWindow W_DemoChat
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   4
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   400
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Chat (TRCustomListBox)"
   Type            =   0
   Visible         =   True
   Width           =   600
   Begin TRCustomListBox TRCLB_Chat
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF
      Composited      =   False
      Enabled         =   True
      FontColor       =   &c00000000
      FontName        =   "System"
      FontSize        =   12
      HasBackgroundColor=   True
      Height          =   400
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RowHeight       =   -1
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   600
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  Static kGroupSpacing As Double = 10
		  
		  Dim row As TRCustomListBoxRow
		  
		  TRCLB_Chat.Rows.Add(TRCustomListBox.SpacerRow(kGroupSpacing))
		  
		  row = New ChatBubbleCustomListBoxRow("What have I got in my pocket?")
		  row.TextAlignment = TextAlignments.Right
		  TRCLB_Chat.Rows.Add(row)
		  
		  TRCLB_Chat.Rows.Add(TRCustomListBox.SpacerRow(kGroupSpacing))
		  
		  row = New ChatBubbleCustomListBoxRow("Not fair! not fair!")
		  row.TextAlignment = TextAlignments.Left
		  TRCLB_Chat.Rows.Add(row)
		  
		  row = New ChatBubbleCustomListBoxRow("It isn't fair, my precious, is it, to ask us what it's got in its nassty little pocketses?")
		  row.TextAlignment = TextAlignments.Left
		  TRCLB_Chat.Rows.Add(row)
		  
		  TRCLB_Chat.Rows.Add(TRCustomListBox.SpacerRow(kGroupSpacing))
		  
		  row = New ChatBubbleCustomListBoxRow("What have I got in my pocket?")
		  row.TextAlignment = TextAlignments.Right
		  TRCLB_Chat.Rows.Add(row)
		  
		  row = New ChatBubbleCustomListBoxRow("S-s-s-s-s, it must give us three guesseses, my precious, three guesseses.")
		  row.TextAlignment = TextAlignments.Left
		  TRCLB_Chat.Rows.Add(row)
		  
		  TRCLB_Chat.Rows.Add(TRCustomListBox.SpacerRow(kGroupSpacing))
		  
		  row = New ChatBubbleCustomListBoxRow("Very well! Guess away!")
		  row.TextAlignment = TextAlignments.Right
		  TRCLB_Chat.Rows.Add(row)
		  
		  TRCLB_Chat.Rows.Add(TRCustomListBox.SpacerRow(kGroupSpacing))
		  
		  row = New ChatBubbleCustomListBoxRow("Handses!")
		  row.TextAlignment = TextAlignments.Left
		  TRCLB_Chat.Rows.Add(row)
		  
		  TRCLB_Chat.Rows.Add(TRCustomListBox.SpacerRow(kGroupSpacing))
		  
		  row = New ChatBubbleCustomListBoxRow("Wrong, guess again!")
		  row.TextAlignment = TextAlignments.Right
		  TRCLB_Chat.Rows.Add(row)
		  
		  TRCLB_Chat.Rows.Add(TRCustomListBox.SpacerRow(kGroupSpacing))
		  
		  row = New ChatBubbleCustomListBoxRow("S-s-s-s-s")
		  row.TextAlignment = TextAlignments.Left
		  TRCLB_Chat.Rows.Add(row)
		  
		  For Each row In TRCLB_Chat.Rows 
		    row.Editable = True
		    row.EditableWithSinglePress = True
		  Next
		  
		  Me.UpdateRowMargins
		  
		  TRCLB_Chat.Update
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub UpdateRowMargins()
		  Dim w As Double = Me.Width
		  
		  For Each row As TRCustomListBoxRow In TRCLB_Chat.Rows
		    If row IsA ChatBubbleCustomListBoxRow Then
		      ChatBubbleCustomListBoxRow(row).UpdateMargins(w)
		    End
		  Next
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events TRCLB_Chat
	#tag Event
		Sub Resizing()
		  
		  Self.UpdateRowMargins
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub WillEditRow(row as TRCustomListBoxRow)
		  
		  Me.CellTextArea.AllowSpellChecking = False
		  Me.CellTextArea.ReadOnly = True
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
