#tag Class
Protected Class ChatBubbleCustomListBoxRow
Inherits TRCustomListBoxRow
	#tag Method, Flags = &h21
		Private Shared Function BubblePath(bubbleWidth as Double, bubbleHeight as Double) As GraphicsPath
		  // Approximate, but not a squircle
		  Dim p As GraphicsPath = New GraphicsPath
		  
		  Dim cornerRadius As Double = 16
		  Dim cornerRadiusCurveV As Double = 7.2
		  
		  p.MoveToPoint(bubbleWidth - cornerRadius, 0)
		  p.AddLineToPoint(cornerRadius, 0)
		  p.AddCurveToPoint(cornerRadiusCurveV, 0, 0, cornerRadiusCurveV, 0, cornerRadius)
		  p.AddLineToPoint(0, bubbleHeight - cornerRadius)
		  p.AddCurveToPoint(0, bubbleHeight - cornerRadiusCurveV, cornerRadiusCurveV, bubbleHeight, cornerRadius, bubbleHeight)
		  p.AddLineToPoint(bubbleWidth - cornerRadius, bubbleHeight)
		  p.AddCurveToPoint(bubbleWidth - cornerRadiusCurveV, bubbleHeight, bubbleWidth, bubbleHeight - cornerRadiusCurveV, bubbleWidth, bubbleHeight - cornerRadius)
		  p.AddLineToPoint(bubbleWidth, cornerRadius)
		  p.AddCurveToPoint(bubbleWidth, cornerRadiusCurveV, bubbleWidth - cornerRadiusCurveV, 0, bubbleWidth - cornerRadius, 0)
		  
		  Return p
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(s as String = "")
		  
		  Super.Constructor(s)
		  
		  Me.MarginLeft = 20
		  Me.MarginRight = 20
		  Me.MarginTop = 10
		  Me.MarginBottom = 15
		  
		  Me.FontSize = 16
		  
		  Me.WordWrap = True
		  Me.Multiline = True
		  
		  Me.Selectable = False
		  
		  'Me.Editable = True
		  'Me.EditableWithSinglePress = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Subclass_DrawBackground(listBox as TRCustomListBox, g as Graphics, visibleWidth as Double, visibleHeight as Double, rowIndex as Integer, editing as Boolean) As Boolean
		  Static kRadius As Double = 20
		  Static kBorder As Double = 5
		  
		  If Not editing And Me.Selected Then
		    g.DrawingColor = Color.HighlightColor
		    g.FillRectangle(0, 0, visibleWidth, visibleHeight)
		  End
		  
		  // Wonky calculations
		  If Me.TextAlignment = TextAlignments.Left Then
		    g.DrawingColor = Color.RGB(0, 0, 0, 255 * 0.9)
		    'g.FillRoundRectangle(Me.MarginLeft - kBorder, kBorder, Me.BubbleWidth + kBorder * 4, visibleHeight - kBorder * 2, kRadius, kRadius)
		    
		    g.SaveState
		    g.Translate(Me.MarginLeft - kBorder, kBorder)
		    g.FillPath(ChatBubbleCustomListBoxRow.BubblePath(Me.BubbleWidth + kBorder * 4, visibleHeight - kBorder * 2))
		    
		    g.RestoreState
		  ElseIf Me.TextAlignment = TextAlignments.Right Then 
		    g.DrawingColor = &c5db4fa
		    Dim additionalLeftMargin As Double = visibleWidth - Me.MarginLeft - Me.MarginRight - Me.BubbleWidth
		    g.FillRoundRectangle(Me.MarginLeft + additionalLeftMargin - kBorder * 6, kBorder, Me.BubbleWidth + kBorder * 4, visibleHeight - kBorder * 2, kRadius, kRadius)
		  End
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateMargins(width as Double)
		  Dim adjustedWidth As Double = width * (1 - kWidthFraction)
		  
		  If Me.TextAlignment = TextAlignments.Left Then
		    Me.MarginRight = adjustedWidth
		  ElseIf Me.TextAlignment = TextAlignments.Right Then 
		    Me.MarginLeft = adjustedWidth
		  End
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BubbleWidth As Double
	#tag EndProperty


	#tag Constant, Name = kWidthFraction, Type = Double, Dynamic = False, Default = \"0.6", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ComputedLineCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ComputedHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
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
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontSize"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineHeight"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Selected"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Editable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Selectable"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineSpacing"
			Visible=false
			Group="Behavior"
			InitialValue="1.2"
			Type="Double"
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
		#tag ViewProperty
			Name="HasCustomFontColor"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EditableWithSinglePress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WordWrap"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Multiline"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MarginBottom"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MarginTop"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MarginLeft"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MarginRight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextAlignment"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="TextAlignments"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Left"
				"2 - Center"
				"3 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ComputedTextHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
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
			Name="Super"
			Visible=true
			Group="ID"
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
	#tag EndViewBehavior
End Class
#tag EndClass