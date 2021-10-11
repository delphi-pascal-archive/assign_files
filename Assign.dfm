object Form1: TForm1
  Left = 203
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Assign files/directories'
  ClientHeight = 430
  ClientWidth = 814
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCC0
    000CCCC0000000000CCCC7777CCCCCCC0000CCCC00000000CCCC7777CCCCCCCC
    C0000CCCCCCCCCCCCCC7777CCCCC0CCCCC0000CCCCCCCCCCCC7777CCCCC700CC
    C00CCCC0000000000CCCC77CCC77000C0000CCCC00000000CCCC7777C7770000
    00000CCCC000000CCCC777777777C000C00000CCCC0000CCCC77777C777CCC00
    CC00000CCCCCCCCCC77777CC77CCCCC0CCC000CCCCC00CCCCC777CCC7CCCCCCC
    CCCC0CCCCCCCCCCCCCC7CCCCCCCCCCCC0CCCCCCCCCCCCCCCCCCCCCC7CCC70CCC
    00CCCCCCCC0CC0CCCCCCCC77CC7700CC000CCCCCC000000CCCCCC777CC7700CC
    0000CCCC00000000CCCC7777CC7700CC0000C0CCC000000CCC7C7777CC7700CC
    0000C0CCC000000CCC7C7777CC7700CC0000CCCC00000000CCCC7777CC7700CC
    000CCCCCC000000CCCCCC777CC7700CC00CCCCCCCC0CC0CCCCCCCC77CC770CCC
    0CCCCCCCCCCCCCCCCCCCCCC7CCC7CCCCCCCC0CCCCCCCCCCCCCC7CCCCCCCCCCC0
    CCC000CCCCC00CCCCC777CCC7CCCCC00CC00000CCCCCCCCCC77777CC77CCC000
    C00000CCCC0000CCCC77777C777C000000000CCCC000000CCCC777777777000C
    0000CCCC00000000CCCC7777C77700CCC00CCCC0000000000CCCC77CCC770CCC
    CC0000CCCCCCCCCCCC7777CCCCC7CCCCC0000CCCCCCCCCCCCCC7777CCCCCCCCC
    0000CCCC00000000CCCC7777CCCCCCC0000CCCC0000000000CCCC7777CCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Bevel1: TBevel
    Left = 424
    Top = 16
    Width = 9
    Height = 401
    Shape = bsLeftLine
  end
  object FileListBox1: TFileListBox
    Left = 216
    Top = 48
    Width = 193
    Height = 369
    FileType = [ftReadOnly, ftHidden, ftSystem, ftArchive, ftNormal]
    ItemHeight = 16
    TabOrder = 0
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 16
    Top = 48
    Width = 193
    Height = 369
    FileList = FileListBox1
    ItemHeight = 16
    TabOrder = 1
    OnChange = DirectoryListBox1Change
  end
  object DriveComboBox1: TDriveComboBox
    Left = 16
    Top = 16
    Width = 193
    Height = 22
    DirList = DirectoryListBox1
    TabOrder = 2
  end
  object FilterComboBox1: TFilterComboBox
    Left = 216
    Top = 16
    Width = 193
    Height = 24
    FileList = FileListBox1
    Filter = 
      'All files (*.*)|*.*|Text(*.txt)|*.txt|Audio(*.mp3;*.wav;*.wma;*.' +
      'cda;*.mid)|*.mp3;*.wav;*.wma;*.cda;*.mid'
    TabOrder = 3
  end
  object Button1: TButton
    Left = 440
    Top = 16
    Width = 161
    Height = 25
    Caption = 'Assign files'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 656
    Top = 48
    Width = 99
    Height = 25
    Caption = 'Save As...'
    TabOrder = 5
    OnClick = Button2Click
  end
  object ListBox1: TListBox
    Left = 440
    Top = 80
    Width = 361
    Height = 337
    ItemHeight = 16
    TabOrder = 6
  end
  object Button3: TButton
    Left = 608
    Top = 16
    Width = 193
    Height = 25
    Caption = 'Assign files with Directories'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 440
    Top = 48
    Width = 161
    Height = 25
    Caption = 'Assign directories'
    TabOrder = 8
    OnClick = Button4Click
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    FileName = 'filespisok'
    Filter = 'Text (*.txt)|*.txt'
    Options = [ofReadOnly, ofOverwritePrompt, ofHideReadOnly]
    Left = 728
    Top = 40
  end
end
