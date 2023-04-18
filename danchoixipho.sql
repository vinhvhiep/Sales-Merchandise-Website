
/****** Object:  Database [WEBBANHANG]    Script Date: 12/20/2022 11:02:21 AM ******/
CREATE DATABASE [WEBBANHANG]

GO
ALTER DATABASE [WEBBANHANG] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WEBBANHANG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WEBBANHANG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WEBBANHANG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WEBBANHANG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WEBBANHANG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WEBBANHANG] SET ARITHABORT OFF 
GO
ALTER DATABASE [WEBBANHANG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WEBBANHANG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WEBBANHANG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WEBBANHANG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WEBBANHANG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WEBBANHANG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WEBBANHANG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WEBBANHANG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WEBBANHANG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WEBBANHANG] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WEBBANHANG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WEBBANHANG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WEBBANHANG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WEBBANHANG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WEBBANHANG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WEBBANHANG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WEBBANHANG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WEBBANHANG] SET RECOVERY FULL 
GO
ALTER DATABASE [WEBBANHANG] SET  MULTI_USER 
GO
ALTER DATABASE [WEBBANHANG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WEBBANHANG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WEBBANHANG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WEBBANHANG] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WEBBANHANG] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WEBBANHANG] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WEBBANHANG] SET QUERY_STORE = OFF
GO
USE [WEBBANHANG]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 12/20/2022 11:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIN](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](25) NULL,
	[created] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
UPDATE STATISTICS [dbo].[ADMIN] WITH ROWCOUNT = 1, PAGECOUNT = 1
GO
/****** Object:  Table [dbo].[CTDH]    Script Date: 12/20/2022 11:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DH_ID] [int] NOT NULL,
	[SP_ID] [int] NOT NULL,
	[SOLUONG] [int] NOT NULL,
 CONSTRAINT [PK_CTDH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONHANG]    Script Date: 12/20/2022 11:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DONHANG](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[TENKH] [nvarchar](50) NOT NULL,
	[SDTKH] [varchar](12) NOT NULL,
	[DIACHIKH] [nvarchar](100) NOT NULL,
	[TONGTIEN] [money] NOT NULL,
	[EMAILKH] [varchar](max) NULL,
	[TRANGTHAI] [bit] NULL,
	[NGAYLAP] [smalldatetime] NULL,
 CONSTRAINT [PK_DONHANG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAI]    Script Date: 12/20/2022 11:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAI](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TENLOAI] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LOAI] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 12/20/2022 11:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TENSP] [nvarchar](100) NOT NULL,
	[DONGIA] [money] NOT NULL,
	[HINHANH] [varchar](max) NOT NULL,
	[NGAYDANG] [smalldatetime] NULL,
	[MOTA] [nvarchar](max) NULL,
	[IDLOAI] [int] NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 12/20/2022 11:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USERS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[address] [nvarchar](125) NOT NULL,
	[created] [smalldatetime] NOT NULL,
	[token] [varchar](32) NULL,
	[password] [varchar](255) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ADMIN] ON 

INSERT [dbo].[ADMIN] ([id], [name], [email], [password], [created]) VALUES (1, N'huy', N'nqhuy20042001@gmail.com', N'626177', CAST(N'2022-12-20T10:41:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ADMIN] OFF
GO
SET IDENTITY_INSERT [dbo].[LOAI] ON 

INSERT [dbo].[LOAI] ([id], [TENLOAI]) VALUES (1, N' thức uống')
INSERT [dbo].[LOAI] ([id], [TENLOAI]) VALUES (3, N'bánh kẹo')
INSERT [dbo].[LOAI] ([id], [TENLOAI]) VALUES (2, N'thực phẩm')
SET IDENTITY_INSERT [dbo].[LOAI] OFF
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (10, N'Sữa trái cây Nutriboost hương dâu', 10000.0000, N'sua-trai-cay-nutri-dao-loc-6x297ml.jpg', CAST(N'2020-06-01T00:00:00' AS SmallDateTime), N'Thương hiệu Nutriboost (Việt Nam)
Sản xuất tại Việt Nam
Loại sữa Sữa trái cây
Độ tuổi sử dụng Dùng cho người trưởng thành (từ 18 tuổi)
Lượng dùng Tối đa 1 chai / hộp mỗi ngày
Hương vị dâu
Thành phần Sữa từ New Zealand
Đặc điểm nổi bật Không chất bảo quản, không chất tạo màu
Dung tích 1 lít
Đóng gói Chai lớn
Sử dụng Lắc đều trước khi uống, ngon hơn khi uống lạnh, bảo quản lạnh và sử dụng trong vòng 24h sau khi mở nắp', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (13, N'Yến mạch ăn liền Quaker', 115000.0000, N'yenmach.jpg', CAST(N'2020-06-01T00:00:00' AS SmallDateTime), N'Loại sản phẩm Yến mạch ăn liền
Khối lượng 600g
Phù hợp Trẻ từ 1 tuổi trở lên
Thành phần Yến mạch 100%
Cách dùng Cho 4 muỗng yến mạch ăn liền (35g) vào tô. Sau đó cho khoảng 200ml nước sôi, đậy kín để làm chín yến mạch. Có thể thêm sữa tươi theo sở thích, khuấy đều và thưởng thức.
Thương hiệu Quaker (Mỹ)
Sản xuất tại Malaysia', 2)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (15, N'Kim chi cải thảo cắt lát', 44000.0000, N'th.png', CAST(N'2020-06-01T00:00:00' AS SmallDateTime), N'Loại sản phẩm Kim chi cải thảo cắt lát
Thành phần Cải thảo muối (cải thảo, nước, muối), củ cải trắng, tỏi, ớt bột, chất làm dày, nước mắm, hành tây, chất điều vị, ruốc muối, hành baro, hẹ, gừng, lợi khuẩn, chất tạo ngọt, chiết xuất hành tỏi
Cách dùng Dùng kèm cơm hoặc các món ăn khác
Bảo quản Lưu trữ ở nhiệt độ 0 - 10 độ C
Thương hiệu Bibigo (Hàn Quốc)
Nơi sản xuất Việt Nam', 2)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (17, N'Măng chua Tre Xanh', 24500.0000, N'mang.png', CAST(N'2020-06-01T00:00:00' AS SmallDateTime), N'Thương hiệu Tre Xanh (Việt Nam)
Nơi sản xuất Việt Nam
Khối lượng 300g
Thành phần Măng (55%), nước, muối
Cách dùng Bỏ nước, rửa lại hoặc luộc trong nước sôi trước khi dùng. Chay mặn đều dùng được
Bảo quản Nơi khô ráo, thoáng mát, đậy kín sau khi dùng', 2)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (19, N'Cà phê đen NesCafé Gold 100g', 155000.0000, N'caphe.jpg', CAST(N'2020-06-01T00:00:00' AS SmallDateTime), N'Thương hiệu NesCafé (Việt Nam)
Sản xuất tại Hàn Quốc
Loại sản phẩm Cà phê đen
Lượng đường Không đường
Đóng gói Hũ
Khối lượng tổng 100g
Điểm nổi bật Sản phẩm dành cho người muốn được thưởng thức cà phê cổ điển, thuần khiết. Với 100% cà phê nguyên chất (không đường, không sữa) giữ được vị đắng đặc trưng và hương thơm đậm đà của cà phê', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (33, N'Bia Halida 330ml', 9000.0000, N'bia halidajpg.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Thương hiệu Halida (Việt Nam)
Sản xuất tại Việt Nam
Loại sản phẩm Bia
Nồng độ cồn 5%
Thể tích 330ml
Thành phần Nước, đại mạch, gạo, hoa bia
Đóng gói Lon
Điểm nổi bật Tên gọi Halida là sự kết hợp giữa Hà Nội, Liên doanh và Đan Mạch. Rất nhiều thương hiệu bia có âm Da ở cuối, thường sử dụng để thể hiện việc bia được sản xuất bởi công nghệ và thiết bị của Đan Mạch.
Lưu ý Sản phẩm dành cho người trên 18 tuổi và không dành cho phụ nữ mang thai. Thưởng thức có trách nhiệm, đã uống đồ uống có cồn thì không lái xe!', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (34, N'Sữa dinh dưỡng Vinamilk 220ml', 6600.0000, N'suavnm.png', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Loại sữa Sữa dinh dưỡng socola
Dung tích 220ml
Phù hợp với Trẻ từ 1 tuổi trở lên
Thành phần Nước, sữa bột, đường tinh luyện, chất béo sữa, dầu thực vật, bột cacao (4,2g/l), chất ổn định (471,407,412), hương liệu tổng hợp dùng cho thực phẩm, vitamin (A, D3)
Thương hiệu Vinamilk (Việt Nam)
Sản xuất tại Việt Nam', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (35, N'Sữa chua uống LiF Kun túi 110ml', 5000.0000, N'suachuauong.png', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Hương vị hương cam
Phù hợp Trẻ em từ 3 tuổi trở lên và người lớn
Thể tích 110ml
Thành phần Sữa lên men tự nhiên (nước, sữa bò tươi, bột sữa, chất béo sữa, men Streptococcus và Lactobacillus), đường, mạch nha, chất ổn định dùng cho thực phẩm (E466, E440), hương cam tổng hợp, màu thực phẩm (E160(aii)), vitamin (A, D3, B1, B3, B6)
Thương hiệu LiF Kun (Úc)
Sản xuất Việt Nam', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (36, N'Bột ăn dặm Nestlé Cerelac cá và rau xanh', 68000.0000, N'botandam.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Độ tuổi Từ 8 tháng
Hương vị Cá và rau xanh
Năng lượng 418.6kcal/100g
Trọng lượng 200g
Thành phần Bột lúa mì, sữa bột tách béo, đường sucrose, dầu thực vật, maltodextrin....
Thương hiệu Nestlé (Thụy Sỹ)
Sản xuất Malaysia', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (37, N'Sữa bột Nestlé NAN Optipro 1', 397000.0000, N'suabotuong.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Trọng lượng 800g
Độ tuổi 0 - 6 tháng
Phù hợp Bổ sung dinh dưỡng, tăng sức đề kháng, tăng khả năng hấp thu, hỗ trợ hệ tiêu hoá
Năng lượng 66.95kcal/ 100ml
Thành phần Đạm whey, Lactose, dầu cọ, sữa bột tách béo,...
Hạn sử dụng 3 tuần sau khi mở nắp
Thương hiệu NAN - Nestlé (Thụy Sỹ)
Sản xuất Hà Lan', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (38, N'Sữa đặc có đường Ông Thọ ', 29000.0000, N'suaongtho.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Loại sản phẩm Sữa đặc có đường
Trọng lượng 380g
Thành phần Đường, nước, sữa bột, chất béo sữa, Whey bột,...
Hương vị Ngọt dịu, béo
Độ đạm 7g/100g
Thích hợp Pha cà phê, xay sinh tố, làm sữa chua, bánh flan...
Thương hiệu Ông Thọ (Việt Nam)
Sản xuất Việt Nam', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (39, N'Gạo ngon túi 5kg', 100000.0000, N'gaongon.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Đặc tính Cơm dẻo mềm, hạt săn, ngọt và thơm nhẹ ngay cả khi để nguội.
Độ nở Nở vừa
Canh tác Theo quy trình chăm sóc khoa học, không chất kích thích tăng trưởng
Cách nấu 1 chén gạo cho 1 chén nước (tăng giảm tuỳ khẩu vị)
Bảo quản Để nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp
Khuyên dùng Gạo ngon nhất khi sử dụng trong vòng 3 tháng kể từ ngày sản xuất và nấu đúng định lượng ghi trên bao bì
Trọng lượng 5kg
Thương hiệu Bách hoá XANH
Sản xuất tại Chi nhánh công ty lương thực TP.HCM - Xí nghiệp lương thực Sài Gòn Shitake', 2)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (40, N'Gạo lức huyết rồng PMT túi 2kg', 101000.0000, N'Gaoluc.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Đặc tính Hạt gạo màu đỏ, chứa nhiều chất xơ, giàu canxi, sắt...
Độ nở Nở vừa
Công dụng Giúp ngăn ngừa các bệnh về tim mạch, hỗ trợ phòng chống bệnh ung thư, tốt cho hệ miễn dịch
Giống lúa Gạo lứt huyết rồng
Bảo quản Nơi thoáng mát, nên dùng trong 1 tháng sau khi mở bao bì
Trọng lượng 2kg
Thương hiệu PMT (Việt Nam)
Sản xuất tại Việt Nam', 2)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (41, N'Lạp xưởng Mai Quế Lộ 500g', 104000.0000, N'lapxuong.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Thương hiệu G Kitchen (Việt Nam)
Khối lượng 500g
Thành phần Thịt heo 80%, vỏ bọc (collagen), đường, protein đậu nành, protein thịt, rượu, muối i-ốt, tiêu, chất điều vị (E621), rượu Mai Quế Lộ (0.2%), chất giữ ẩm, chất điều chỉnh độ acid, phẩm màu tự nhiên, chất chống oxi hoá, hương khói tự nhiên và tổng hợp, chất bảo quản (E281, E234, E235)
Cách dùng Chiên, nướng, hấp, ăn trực tiếp hoặc ăn kèm cơm, xôi, củ kiệu,...
Bảo quản Nơi thoáng mát, khô ráo, tránh ánh nắng trực tiếp
Nơi sản xuất Việt Nam', 2)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (42, N'Gầu bò mỹ đông lạnh Thảo Tiên', 132000.0000, N'gaubo.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Cách dùng Dùng để nấu các món ăn tuỳ thích. Không tái cấp đông sau khi đã rã đông.
Thành phần Thịt bò Mỹ nhập khẩu 100%
Nhiệt độ bảo quản -18 độ C hoặc ngăn đá tủ lạnh
Khối lượng 300g
Thương hiệu Thảo Tiên Foods (Việt Nam)
Nơi sản xuất Việt Nam', 2)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (43, N'Tôm thịt Đôi Đũa Vàng 450g', 149000.0000, N'tomsach.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Khối lượng 450g
Thành phần Tôm thịt (>90%), chất ổn định (INS-452i)
Cách dùng Rã đông sản phẩm trước khi sử dụng. Phương pháp rã đông tốt nhất là để sản phẩm ở ngăn mát tủ lạnh (0 - 5 độ C) trong khoảng 4 - 5 giờ. Dùng chế biến các món ăn tuỳ thích
Nhiệt độ bảo quản -18 độ C hoặc ngăn đá tủ lạnh
Thương hiệu Đôi Đũa Vàng (Việt Nam)
Nơi sản xuất Việt Nam', 2)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (44, N'Snack khoai tây vị cua xào ớt Peke', 19000.0000, N'skane.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Loại bánh Snack khoai tây vị cua xào ớt
Khối lượng 80g
Năng lượng 400.1kcal/80g
Thành phần Vẩy khoai tây, dầu thực vật (dầu cọ), tinh bột khoai tây, muối, đường, bột đậu nành, miếng rong biển, maltodextrin, lactose, gia vị, anti-caking agent, chất nhũ hoá
Bảo quản Bảo quản nơi khô mát, tránh ánh nắng trực tiếp và nhiệt độ cao
Thương hiệu Peke (Trung Quốc)
Nơi sản xuất Trung Quốc', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (45, N'Bánh trứng kem sầu riêng Tipo', 41000.0000, N'tipo.png', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Loại sản phẩm Bánh trứng kem sầu riêng
Năng lượng 490kcal/ 100g
Thành phần Trứng 25%, đường, bột mì, sữa bột, bột sầu riêng,...
Bảo quản Để nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp
Thương hiệu Tipo (Việt Nam)
Nơi sản xuất Việt Nam', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (46, N'Bánh kem phô mai dâu Custas 282g', 70000.0000, N'custa.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Loại bánh Bánh custas kem phô mai dâu
Số lượng 12 cái x 23.5g
Năng lượng 100 kcal/1 cái
Thành phần Bột mì, đường, trứng, dầu thực vật, chất béo thực vật hydro hoá hoàn toàn, chất giữ ẩm, mứt trái cây hỗn hợp, cồn thực phẩm, bột kem sữa, bột phô mai, muối i-ốt, hương tổng hợp,...
Khối lượng tổng 282g
Thương hiệu Custas (Hàn Quốc)
Nơi sản xuất Việt Nam', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (47, N'Bánh xốp nhân phô mai Cai Cheese', 6500.0000, N'calchese.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Loại bánh Bánh xốp nhân phô mai
Phù hợp Bổ sung canxi, Vitamin A, B1, B6, B12 hỗ trợ phát triển chiều cao
Thành phần Bột mì, đường, dầu thực vật (chứa chất chống oxy hóa BHA), kem không sữa, bột whey, maltodextrin, bột sữa, bột phô mai, muối, calcium cacbornat, soy lecithin (Elmusifier), hương phô mai, bột nổi, men, màu thực phẩm (Sun set yellow FCF CI 15985 , Tartrazine CI 19140), Vitamins (A, B1, B6, B12)
Năng lượng 501 Kcal/100g
Bảo quản Bảo quản nơi khô mát, tránh ánh nắng trực tiếp
Khối lượng 53.5g
Thương hiệu Cal Cheese (Indonesia)
Sản xuất Indonesia', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (48, N'Bánh Choco-pie hộp 396g', 55000.0000, N'chocopie.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Loại bánh Bánh choco-pie
Số lượng 12 cái x 33g
Khối lượng tổng 396g
Năng lượng Khoảng 140kcal/1 cái
Thành phần Bột mì, đường, glucose syrup, shortening thực vật, chất béo thực vật không hydro hoá, isomalto oligo syrup, bột cacao, sữa bột nguyên kem, trứng, chất tạo xốp, đường dextrose, gelatin, muối i-ốt,...
Bảo quản Bảo quản nơi khô ráo và thoáng mát, tránh ánh nắng trực tiếp
Thương hiệu Choco-pie (Hàn Quốc)
Nơi sản xuất Việt Nam', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (49, N'Kẹo dẻo Yupi Cola Burger', 29000.0000, N'yupi.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Loại kẹo Kẹo dẻo hương cola
Ưu điểm Viên kẹo mềm dẻo thơm ngon, cùng hình dáng ngộ nghĩnh, mang lại cảm giác thích thú khi thưởng thức.
Khối lượng 96g
Thành phần Glucose syrup, đường, nước, gelatine từ bò, chất giữ ẩm E420i, chất điều chỉnh độ acid (E330, E270), protein sữa, hương thực phẩm tự nhiên và tổng hợp, chất làm bóng (E901/E903), màu thực phẩm (E110, E150c, E160a(i))
Thương hiệu Yupi (Indonesia)
Sản xuất Indonesia', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (50, N'Xoài sấy dẻo Mekong Yummy', 123000.0000, N'xoaisay.png', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Loại sản phẩm Xoài sấy dẻo
Dạng sấy Sấy dẻo - sử dụng nhiệt độ cao (50 - 70 độ C) để làm mất đi một phần hơi nước của sản phẩm rồi đem đi làm mát
Đặc tính Dẻo, mềm, hơi dai
Năng lượng 90kcal/25g
Khối lượng 200g
Thành phần Xoài tươi 97%, đường 3%
Bảo quản Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp. Nên dùng hết trong vòng 14 ngày sau khi mở bao bì
Thương hiệu Mekong Yummy (Việt Nam)
Nơi sản xuất Việt Nam', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (51, N'Mít sấy Vinamit gói 250g', 78000.0000, N'mitsay.jpg', CAST(N'2020-06-04T00:00:00' AS SmallDateTime), N'Loại sản phẩm Mít sấy
Dạng sấy Sấy chân không - dùng máy hút chân không hút toàn bộ lượng nước thoát ra và ngăn không cho dầu thấm ngược trở lại sản phẩm.
Đặc tính Giòn, lượng dầu thấp, giữ được hương vị, màu sắc cũng như hàm lượng dinh dưỡng
Năng lượng 120 kcal/28g
Khối lượng 250g
Thành phần Mít 98%, dầu thực vật
Bảo quản Bảo quản nơi khô ráo, thoáng mát. Đậy kín bao bì sau khi sử dụng
Thương hiệu Vinamit (Việt Nam)
Nơi sản xuất Việt Nam', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (55, N'Cà rốt', 12000.0000, N'carot.png', CAST(N'2020-06-08T00:00:00' AS SmallDateTime), N'Cà rốt tươi sạch hân hạnh phục vụ quý khách,
', 2)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (56, N'Cam Sành ', 60000.0000, N'camsanh.png', CAST(N'2021-03-31T00:00:00' AS SmallDateTime), N'Cam sành hái tại cây thơm ngon luôn có sẵn trên ứng dụng.', 2)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (57, N'Hộp 10 trứng gà tươi QLEgg', 27000.0000, N'hop-10-trung-ga-tuoi-qlegg-202103271352288194.jpg', CAST(N'2021-05-29T00:00:00' AS SmallDateTime), N'Trứng gà là một loại thực phẩm chứa nhiều chất dinh dưỡng, cung cấp lượng đạm cao, cung cấp chất béo và vitamin, khoáng chất. Trứng gà Happy Egg được sản xuất ở trang trại sạch, chất lượng, nên khách hàng có thể yên tâm về sản phẩm.', 2)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 

INSERT [dbo].[USERS] ([id], [name], [email], [phone], [address], [created], [token], [password]) VALUES (1, N'Nguyễn Quốc Huy', N'nqhuy20042001@gmail.com', N'0938626177', N'123456789', CAST(N'2022-12-20T00:00:00' AS SmallDateTime), N'AzQwbpcyUVFJCmVwOTCm0OW3ux7SJ4_T', N'08182BF62BD9342ECB5119E757F01802247270C1')
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_LOAI]    Script Date: 12/20/2022 11:02:21 AM ******/
ALTER TABLE [dbo].[LOAI] ADD  CONSTRAINT [UK_LOAI] UNIQUE NONCLUSTERED 
(
	[TENLOAI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LOAI]    Script Date: 12/20/2022 11:02:21 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LOAI] ON [dbo].[LOAI]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_SANPHAM]    Script Date: 12/20/2022 11:02:21 AM ******/
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [UK_SANPHAM] UNIQUE NONCLUSTERED 
(
	[TENSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_USERS]    Script Date: 12/20/2022 11:02:21 AM ******/
ALTER TABLE [dbo].[USERS] ADD  CONSTRAINT [UK_USERS] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADMIN] ADD  CONSTRAINT [DF_ADMIN_created]  DEFAULT (getdate()) FOR [created]
GO
ALTER TABLE [dbo].[DONHANG] ADD  CONSTRAINT [DF_DONHANG_TRANGTHAI]  DEFAULT ((0)) FOR [TRANGTHAI]
GO
ALTER TABLE [dbo].[DONHANG] ADD  CONSTRAINT [DF_DONHANG_NGAYLAP]  DEFAULT (getdate()) FOR [NGAYLAP]
GO
ALTER TABLE [dbo].[USERS] ADD  CONSTRAINT [DF_users_name]  DEFAULT (N'unique') FOR [name]
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_DONHANG] FOREIGN KEY([DH_ID])
REFERENCES [dbo].[DONHANG] ([id])
GO
ALTER TABLE [dbo].[CTDH] CHECK CONSTRAINT [FK_CTDH_DONHANG]
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_SANPHAM] FOREIGN KEY([SP_ID])
REFERENCES [dbo].[SANPHAM] ([id])
GO
ALTER TABLE [dbo].[CTDH] CHECK CONSTRAINT [FK_CTDH_SANPHAM]
GO
ALTER TABLE [dbo].[DONHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONHANG_USERS] FOREIGN KEY([user_id])
REFERENCES [dbo].[USERS] ([id])
GO
ALTER TABLE [dbo].[DONHANG] CHECK CONSTRAINT [FK_DONHANG_USERS]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_LOAI] FOREIGN KEY([IDLOAI])
REFERENCES [dbo].[LOAI] ([id])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_LOAI]
GO
/****** Object:  StoredProcedure [dbo].[SP_HIENTHI]    Script Date: 12/20/2022 11:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_HIENTHI]
AS
	SELECT * FROM dbo.users 
GO
/****** Object:  Statistic [_WA_Sys_00000001_34C8D9D1]    Script Date: 12/20/2022 11:02:21 AM ******/
CREATE STATISTICS [_WA_Sys_00000001_34C8D9D1] ON [dbo].[ADMIN]([id]) WITH STATS_STREAM = 0x01000000010000000000000000000000A0FA23E900000000DB010000000000009B01000000000000380300003800000004000A000000000000000000AC020000070000004A47B00071AF000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000014000000000080400000803F00000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110400000000000000000000000000001F0000000000000027000000000000002F000000000000000800000000000000100014000000803F000000000000803F0100000004000001000000000000000000000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000002_34C8D9D1]    Script Date: 12/20/2022 11:02:21 AM ******/
CREATE STATISTICS [_WA_Sys_00000002_34C8D9D1] ON [dbo].[ADMIN]([name]) WITH STATS_STREAM = 0x010000000100000000000000000000000CE1373C00000000EB01000000000000AB01000000000000E7020000E7000000640000000000000008D000340000000007000000C9FCAF0071AF000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000010000000000000000000803F0000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000120400000000000000000000000000002F0000000000000037000000000000003F00000000000000FF0100000001000000010000000100000028000000280000000000000000000000000000000100000000000000000001000000000000000000000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000003_34C8D9D1]    Script Date: 12/20/2022 11:02:21 AM ******/
CREATE STATISTICS [_WA_Sys_00000003_34C8D9D1] ON [dbo].[ADMIN]([email]) WITH STATS_STREAM = 0x0100000001000000000000000000000091CE2F0000000000EB01000000000000AB01000000000000A7020000A7000000320000000000000008D000340000000007000000C8FCAF0071AF000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000010000000000000000000803F0000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000120400000000000000000000000000002F0000000000000037000000000000003F00000000000000FF0100000001000000010000000100000028000000280000000000000000000000000000000100000000000000000001000000000000000000000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000004_34C8D9D1]    Script Date: 12/20/2022 11:02:21 AM ******/
CREATE STATISTICS [_WA_Sys_00000004_34C8D9D1] ON [dbo].[ADMIN]([password]) WITH STATS_STREAM = 0x010000000100000000000000000000000DB8C05500000000EB01000000000000AB01000000000000A7020000A7000000190000000000000008D000340000000007000000C8FCAF0071AF000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000010000000000000000000803F0000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000120400000000000000000000000000002F0000000000000037000000000000003F00000000000000FF0100000001000000010000000100000028000000280000000000000000000000000000000100000000000000000001000000000000000000000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000005_34C8D9D1]    Script Date: 12/20/2022 11:02:21 AM ******/
CREATE STATISTICS [_WA_Sys_00000005_34C8D9D1] ON [dbo].[ADMIN]([created]) WITH STATS_STREAM = 0x01000000010000000000000000000000D9BDEC5800000000DB010000000000009B010000000000003A0200003A0000000400100000000000000000000000000007000000C7FCAF0071AF000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000014000000000080400000803F00000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110400000000000000000000000000001F0000000000000027000000000000002F000000000000000800000000000000100014000000803F000000000000803F810271AF04000001000000000000000000000000000000
GO
/****** Object:  Statistic [PK_CTDH]    Script Date: 12/20/2022 11:02:21 AM ******/
UPDATE STATISTICS [dbo].[CTDH]([PK_CTDH]) WITH STATS_STREAM = 0x01000000010000000000000000000000ED0358EE0000000040000000000000000000000000000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 0, PAGECOUNT = 1
GO
/****** Object:  Statistic [PK_DONHANG]    Script Date: 12/20/2022 11:02:21 AM ******/
UPDATE STATISTICS [dbo].[DONHANG]([PK_DONHANG]) WITH STATS_STREAM = 0x01000000010000000000000000000000ED0358EE0000000040000000000000000000000000000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 0, PAGECOUNT = 1
GO
/****** Object:  Statistic [IX_LOAI]    Script Date: 12/20/2022 11:02:21 AM ******/
UPDATE STATISTICS [dbo].[LOAI]([IX_LOAI]) WITH STATS_STREAM = 0x01000000010000000000000000000000ED0358EE0000000040000000000000000000000000000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 3, PAGECOUNT = 1
GO
/****** Object:  Statistic [PK_LOAI]    Script Date: 12/20/2022 11:02:21 AM ******/
UPDATE STATISTICS [dbo].[LOAI]([PK_LOAI]) WITH STATS_STREAM = 0x01000000010000000000000000000000ED0358EE0000000040000000000000000000000000000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 3, PAGECOUNT = 1
GO
/****** Object:  Statistic [UK_LOAI]    Script Date: 12/20/2022 11:02:21 AM ******/
UPDATE STATISTICS [dbo].[LOAI]([UK_LOAI]) WITH STATS_STREAM = 0x01000000020000000000000000000000ECA3878B0000000058000000000000000000000000000000E7030000E7000000640000000000000008D00034000000003803FFFF3800000004000A00000000000000000000000000, ROWCOUNT = 3, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000007_3C69FB99]    Script Date: 12/20/2022 11:02:21 AM ******/
CREATE STATISTICS [_WA_Sys_00000007_3C69FB99] ON [dbo].[SANPHAM]([IDLOAI]) WITH STATS_STREAM = 0x010000000100000000000000000000005014FA19000000001902000000000000D901000000000000380200003800000004000A000000000000000000000000000700000045A2B40071AF00001B000000000000001B0000000000000000000000ABAAAA3E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000030000000100000014000000000080400000D84100000000000080400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000110400000000000000000000000000005D0000000000000065000000000000006D0000000000000018000000000000002F0000000000000046000000000000001000140000000041000000000000803F010000000400001000140000003041000000000000803F020000000400001000140000000041000000000000803F030000000400001B000000000000000000000000000000
GO
/****** Object:  Statistic [PK_SANPHAM]    Script Date: 12/20/2022 11:02:21 AM ******/
UPDATE STATISTICS [dbo].[SANPHAM]([PK_SANPHAM]) WITH STATS_STREAM = 0x01000000010000000000000000000000ED0358EE0000000040000000000000000000000000000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 27, PAGECOUNT = 3
GO
/****** Object:  Statistic [UK_SANPHAM]    Script Date: 12/20/2022 11:02:21 AM ******/
UPDATE STATISTICS [dbo].[SANPHAM]([UK_SANPHAM]) WITH STATS_STREAM = 0x01000000020000000000000000000000856636D90000000058000000000000000000000000000000E7030000E7000000C80000000000000008D00034000000003803FFFF3800000004000A00000000000000000000000000, ROWCOUNT = 27, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000008_3F466844]    Script Date: 12/20/2022 11:02:21 AM ******/
CREATE STATISTICS [_WA_Sys_00000008_3F466844] ON [dbo].[USERS]([password]) WITH STATS_STREAM = 0x01000000010000000000000000000000928F33510000000067020000000000002702000000000000A7020000A7000000FF0000000000000008D000340000000007000000C65AAF0071AF000001000000000000000100000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000010000000000020420000803F00000000000020420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000130400000000000000000000000000004700000000000000A300000000000000AB00000000000000B3000000000000000800000000000000300010000000803F000000000000803F04000001003F0030383138324246363242443933343245434235313139453735374630313830323234373237304331FF0100000000000000010000000100000028000000280000000000000000000000280000003038313832424636324244393334324543423531313945373537463031383032323437323730433102000000400000000001280000000001000000000000000000000000000000
GO
/****** Object:  Statistic [PK_user]    Script Date: 12/20/2022 11:02:21 AM ******/
UPDATE STATISTICS [dbo].[USERS]([PK_user]) WITH STATS_STREAM = 0x01000000010000000000000000000000ED0358EE0000000040000000000000000000000000000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 1, PAGECOUNT = 1
GO
/****** Object:  Statistic [UK_USERS]    Script Date: 12/20/2022 11:02:21 AM ******/
UPDATE STATISTICS [dbo].[USERS]([UK_USERS]) WITH STATS_STREAM = 0x01000000020000000000000000000000934BE56F000000005D020000000000000502000000000000A7030000A7000000320000000000000008D0003400000000380300003800000004000A0000000000000000000000000007000000C55AAF0071AF000001000000000000000100000000000000000000000000803F0000803F00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000100000002000000100000000000D8410000803F000000000000B84100008040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001304000000000000000000000000000036000000000000008100000000000000890000000000000091000000000000000800000000000000300010000000803F000000000000803F04000001002E006E71687579323030343230303140676D61696C2E636F6DFF0100000000000000010000000100000028000000280000000000000000000000170000006E71687579323030343230303140676D61696C2E636F6D02000000400000000001170000000001000000000000000000000000000000, ROWCOUNT = 1, PAGECOUNT = 1
GO
USE [master]
GO
ALTER DATABASE [WEBBANHANG] SET  READ_WRITE 
GO