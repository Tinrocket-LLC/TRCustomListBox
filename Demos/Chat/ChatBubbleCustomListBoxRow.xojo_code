#tag Class
Protected Class ChatBubbleCustomListBoxRow
Inherits TRCustomListBoxRow
	#tag Method, Flags = &h0
		Sub Constructor(s as String)
		  
		  Super.Constructor(s)
		  
		  Me.MarginLeft = 10
		  Me.MarginRight = 10
		  Me.MarginTop = 10
		  Me.MarginBottom = 10
		  
		  Me.FontSize = 16
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Subclass_DrawBackground(g as Graphics, rowIndex as Integer) As Boolean
		  
		  Static kRadius As Double = 10
		  Static kBorder As Double = 5
		  
		  g.DrawingColor = Color.RGB(0, 0, 0, 255 * 0.9)
		  g.FillRoundRectangle(kBorder, kBorder, g.Width - kBorder * 2, g.Height - kBorder * 2, kRadius, kRadius)
		  
		End Function
	#tag EndMethod


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
