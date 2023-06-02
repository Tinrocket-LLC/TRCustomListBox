#tag DesktopWindow
Begin DesktopContainer TRCustomListBox
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   True
   Height          =   300
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   300
   Begin DesktopCanvas C_Content
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   300
      Index           =   -2147483648
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   300
   End
   Begin DesktopTextArea TA_Cell
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   False
      Height          =   100
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   361
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   1
      ValidationMask  =   ""
      Visible         =   False
      Width           =   100
   End
   Begin TRProportionalDesktopScrollbar SB_Vertical
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowLiveScrolling=   True
      AllowTabStop    =   True
      AutoHide        =   True
      Enabled         =   True
      Height          =   300
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   285
      LineStep        =   5
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   20
      MinimumValue    =   0
      PageStep        =   100
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   15
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopTextArea TA_RenderSource
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   False
      Height          =   100
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   387
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   1
      ValidationMask  =   ""
      Visible         =   True
      Width           =   100
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		  Me.ContentOffset = New Point
		  
		  Me.FontCalculator = New Picture(2, 2)
		  Me.FontCalculatorGraphics = Me.FontCalculator.Graphics
		  
		  TA_Cell.BackgroundColor = Color.Clear
		  TA_RenderSource.BackgroundColor = Color.Clear
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  
		  Me.Update(True)
		  
		  TA_RenderSource.Left = Me.Width + 100
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DeselectAll(doRefresh as Boolean = True)
		  Dim i As Integer
		  
		  // Deselect all
		  For i = 0 To Me.Rows.LastIndex
		    Me.Rows(i).Selected = False
		  Next
		  
		  // TODO: Validate? Maybe send an event
		  
		  TA_Cell.Visible = False
		  
		  If doRefresh Then
		    C_Content.Refresh
		  End
		  
		  Me.EditedRowIndex = -1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EditRow(rowIndex as Integer)
		  
		  Self.EditedRowIndex = rowIndex
		  
		  If Self.EditedRowIndex < 0 Then
		    TA_Cell.Visible = False
		    Return
		  End
		  
		  Self.Update_TextArea(TA_Cell, Me.Rows(Me.EditedRowIndex), False)
		  Self.Update_TextArea_Location
		  
		  TA_Cell.Visible = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Press(pressedRowIndex as Integer, doublePress as Boolean = False)
		  Dim i As Integer
		  Dim row As TRCustomListBoxRow = Me.Rows(pressedRowIndex)
		  
		  If row.Selectable Then
		    // TODO: Single row selection for now
		    Me.DeselectAll(False)
		    
		    row.Selected = True
		  End
		  
		  If row.Editable Then
		    If row.EditableWithSinglePress Or doublePress Then
		      Self.EditRow(pressedRowIndex)
		    End
		  End
		  
		  Me.Refresh
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Press(x as Integer, y as Integer, doublePress as Boolean = False)
		  Dim i As Integer
		  Dim runningHeight As Double
		  
		  // Recompute pressed location
		  x = x - Me.ContentOffset.X
		  y = y - Me.ContentOffset.Y
		  
		  // Check for hit
		  For i = 0 To Me.rows.LastIndex
		    runningHeight = runningHeight + Me.Rows(i).ComputedHeight
		    
		    If y < runningHeight Then
		      // Found pressed cell
		      
		      Me.Press(i, doublePress)
		      
		      Return
		    End
		  Next
		  
		  Me.DeselectAll(True)
		  
		  Return // Not found
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowFontColor(row as TRCustomListBoxRow) As Color
		  #Pragma BackgroundTasks False
		  #Pragma StackOverflowChecking False
		  #Pragma NilObjectChecking False
		  #Pragma BoundsChecking False
		  
		  If row.HasCustomFontColor Then
		    Return row.FontColor
		  End
		  
		  Return Self.FontColor
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowFontName(row as TRCustomListBoxRow) As String
		  #Pragma BackgroundTasks False
		  #Pragma StackOverflowChecking False
		  #Pragma NilObjectChecking False
		  #Pragma BoundsChecking False
		  
		  If row.FontName <> "" Then
		    Return row.FontName
		  End
		  
		  Return Self.FontName
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowFontSize(row as TRCustomListBoxRow) As Double
		  #Pragma BackgroundTasks False
		  #Pragma StackOverflowChecking False
		  #Pragma NilObjectChecking False
		  #Pragma BoundsChecking False
		  
		  If row.FontSize > 0 Then
		    Return row.FontSize
		  End
		  
		  Return Self.FontSize
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowLineHeight(row as TRCustomListBoxRow, fontName as String, fontSize as Double) As Double
		  #Pragma BackgroundTasks False
		  #Pragma StackOverflowChecking False
		  #Pragma NilObjectChecking False
		  #Pragma BoundsChecking False
		  
		  If row.LineHeight > 0 Then
		    Return row.LineHeight
		  End
		  
		  Dim g As Graphics = Me.FontCalculatorGraphics
		  
		  g.FontName = fontName
		  g.FontSize = fontSize
		  
		  Return g.TextHeight * row.LineSpacing
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowTextAreaWidth(row as TRCustomListBoxRow) As Double
		  #Pragma BackgroundTasks False
		  #Pragma StackOverflowChecking False
		  #Pragma NilObjectChecking False
		  #Pragma BoundsChecking False
		  
		  Dim textLeft As Double = row.MarginLeft
		  Dim textWidth As Double = Me.Width - textLeft - kTextAreaRightMarginPoints - SB_Vertical.Width - row.MarginRight
		  
		  Return textWidth
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update(lockOffset as Boolean = False)
		  
		  Me.Update_ComputeHeight
		  
		  Dim offsetY As Double = SB_Vertical.GetContentOffset(Me.ComputedTotalHeight, Me.Height)
		  
		  If Not lockOffset Then
		    Me.ContentOffset.Y = offsetY
		  End
		  
		  Me.Update_TextArea_Location
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Update_ComputeHeight()
		  Dim i As Integer
		  Dim g As Graphics = Me.FontCalculatorGraphics
		  
		  Me.ComputedTotalHeight = 0
		  
		  For i = 0 To Self.Rows.LastIndex
		    Dim row As TRCustomListBoxRow = Self.Rows(i)
		    
		    Me.Update_ComputeHeight_Row(row, g)
		    Me.ComputedTotalHeight = Me.ComputedTotalHeight + row.ComputedHeight
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Update_ComputeHeight_Row(row As TRCustomListBoxRow, g As Graphics)
		  #Pragma BackgroundTasks False
		  #Pragma StackOverflowChecking False
		  #Pragma NilObjectChecking False
		  #Pragma BoundsChecking False
		  Dim lineHeight As Double
		  Dim lines(-1) As String
		  
		  If row.Height > 0 Then
		    row.ComputedHeight = row.Height
		  ElseIf Me.RowHeight > 0 Then
		    row.ComputedHeight = Me.RowHeight
		  Else
		    g.FontName = Self.RowFontName(row)
		    g.FontSize = Self.RowFontSize(row)
		    lineHeight = Self.RowLineHeight(row, g.FontName, g.FontSize)
		    
		    Self.Update_TextArea(TA_RenderSource, row, False)
		    TA_RenderSource.Width = Self.RowTextAreaWidth(row)
		    
		    If row.WordWrap And row.Multiline Then
		      // Might be issue with right justification?
		      TA_RenderSource.Text = TA_RenderSource.Text + "  " // Add two characters to workaround: https://tracker.xojo.com/xojoinc/xojo/-/issues/72962
		    End
		    
		    Dim lineCount As Integer = TA_RenderSource.LineNumber(TA_RenderSource.Text.Length) + 1
		    
		    row.ComputedHeight = lineCount * g.TextHeight * TA_RenderSource.LineSpacing
		  End
		  
		  row.ComputedHeight = row.MarginTop + row.ComputedHeight + row.MarginBottom
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Update_TextArea(ta as DesktopTextArea, row as TRCustomListBoxRow, drawHighlight as Boolean)
		  
		  ta.Text = row.Text
		  ta.FontName = Me.RowFontName(row)
		  ta.FontSize = Me.RowFontSize(row)
		  ta.LineHeight = row.LineHeight
		  ta.LineSpacing = row.LineSpacing
		  ta.TextColor = Me.RowFontColor(row)
		  ta.TextAlignment = row.TextAlignment
		  
		  If drawHighlight And row.Selected Then
		    ta.BackgroundColor = Color.HighlightColor
		  Else
		    ta.BackgroundColor = Me.BackgroundColor
		  End
		  
		  ta.MultiLine = row.Multiline
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Update_TextArea_Location()
		  
		  If Self.EditedRowIndex < 0 Then 
		    Return
		  End
		  
		  Dim i As Integer
		  Dim yOfEditedRow As Double = Me.ContentOffset.Y
		  
		  For i = 0 To Self.EditedRowIndex-1
		    yOfEditedRow = yOfEditedRow + Me.Rows(i).ComputedHeight
		  Next
		  
		  Dim row As TRCustomListBoxRow = Me.Rows(Me.EditedRowIndex)
		  
		  TA_Cell.Top = yOfEditedRow
		  TA_Cell.Left = row.MarginLeft - kTextAreaLeftMarginPoints
		  TA_Cell.Width = Me.Width - TA_Cell.Left - SB_Vertical.Width - row.MarginRight
		  TA_Cell.Height = row.ComputedHeight
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ComputedTotalHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		ContentOffset As Point
	#tag EndProperty

	#tag Property, Flags = &h21
		Private EditedRowIndex As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FontCalculator As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FontCalculatorGraphics As Graphics
	#tag EndProperty

	#tag Property, Flags = &h0
		FontColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		FontName As String = "System"
	#tag EndProperty

	#tag Property, Flags = &h0
		FontSize As Integer = 12
	#tag EndProperty

	#tag Property, Flags = &h0
		RowHeight As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		Rows(-1) As TRCustomListBoxRow
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SelectedRowIndex As Integer = -1
	#tag EndProperty


	#tag Constant, Name = kTextAreaLeftMarginPoints, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTextAreaRightMarginPoints, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events C_Content
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  Dim i, j As Integer
		  Dim lineHeight, textHeight As Double
		  Dim runningY As Double
		  
		  g.FontSize = 16
		  g.DrawingColor = Color.Black
		  g.Translate(Self.ContentOffset.X, Self.ContentOffset.Y)
		  runningY = Self.ContentOffset.Y
		  
		  Dim editRow As TRCustomListBoxRow
		  If Not Self.EditedRowIndex < 0 Then
		    editRow = Self.Rows(Self.EditedRowIndex)
		  End
		  
		  For i = 0 To Self.Rows.LastIndex
		    Dim row As TRCustomListBoxRow = Self.Rows(i)
		    
		    runningY = runningY + row.ComputedHeight
		    If runningY < 0 Then
		      g.Translate(0, row.ComputedHeight) // Advance
		      Continue // Don't draw yet
		    ElseIf runningY - row.ComputedHeight > g.Height Then
		      Return // Stop drawing
		    End
		    
		    If i <> Self.EditedRowIndex Then // Don't draw edited row; there's a text area covering it
		      Dim drawHighlight As Boolean = row <> editRow And row.Selected
		      If drawHighlight Then
		        g.DrawingColor = Color.HighlightColor
		        g.FillRectangle(0, 0, g.Width, row.ComputedHeight)
		      End
		      
		      g.DrawingColor = Self.RowFontColor(row)
		      g.FontName = Self.RowFontName(row)
		      g.FontSize = Self.RowFontSize(row)
		      
		      Self.Update_TextArea(TA_RenderSource, row, drawHighlight)
		      
		      TA_RenderSource.Height = row.ComputedHeight
		      TA_RenderSource.Width = Self.RowTextAreaWidth(row)
		      TA_RenderSource.MultiLine = row.WordWrap
		      
		      TA_RenderSource.DrawInto(g, row.MarginLeft, row.MarginTop)
		    End
		    
		    g.Translate(0, Round(row.ComputedHeight)) // Advance
		  Next
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(x As Integer, y As Integer, deltaX As Integer, deltaY As Integer) As Boolean
		  
		  SB_Vertical.Value = SB_Vertical.Value + SB_Vertical.LineStep * Sign(deltaY)
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  
		  Self.Press(x, y)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoublePressed(x As Integer, y As Integer)
		  
		  Self.Press(x, y, True)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TA_Cell
	#tag Event
		Sub TextChanged()
		  If Self.EditedRowIndex < 0 Then Return
		  
		  Dim row As TRCustomListBoxRow = Self.Rows(Self.EditedRowIndex)
		  
		  If Not row.Multiline Then
		    // Manually filter out line endings, because the TextArea is not always handling it before this event
		    Me.Text = Me.Text.ReplaceAll(EndOfLine, "")
		  End
		  
		  row.Text = Me.Text
		  
		  // Self.Update_ComputeHeight
		  // No need to do above, just do the following:
		  Dim beforeHeight As Double = row.ComputedHeight
		  Self.Update_ComputeHeight_Row(row, Self.FontCalculatorGraphics)
		  Self.ComputedTotalHeight = Self.ComputedTotalHeight - beforeHeight + row.ComputedHeight
		  
		  Self.Update(True)
		  Self.Refresh(True)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(x As Integer, y As Integer, deltaX As Integer, deltaY As Integer) As Boolean
		  
		  SB_Vertical.Value = SB_Vertical.Value + SB_Vertical.LineStep * Sign(deltaY)
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events SB_Vertical
	#tag Event
		Sub ValueChanged()
		  
		  Self.Update
		  
		  C_Content.Refresh
		  
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
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
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composited"
		Visible=true
		Group="Window Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="RowHeight"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FontName"
		Visible=false
		Group="Behavior"
		InitialValue="System"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FontSize"
		Visible=false
		Group="Behavior"
		InitialValue="12"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FontColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
