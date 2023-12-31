USE [master]
GO

CREATE DATABASE [AssignmentPrj]
GO
ALTER DATABASE [AssignmentPrj] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [AssignmentPrj] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssignmentPrj] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssignmentPrj] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssignmentPrj] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssignmentPrj] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssignmentPrj] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AssignmentPrj] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssignmentPrj] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssignmentPrj] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssignmentPrj] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssignmentPrj] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssignmentPrj] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssignmentPrj] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssignmentPrj] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssignmentPrj] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AssignmentPrj] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssignmentPrj] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssignmentPrj] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssignmentPrj] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssignmentPrj] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssignmentPrj] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AssignmentPrj] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssignmentPrj] SET RECOVERY FULL 
GO
ALTER DATABASE [AssignmentPrj] SET  MULTI_USER 
GO
ALTER DATABASE [AssignmentPrj] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssignmentPrj] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssignmentPrj] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssignmentPrj] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AssignmentPrj] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AssignmentPrj] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AssignmentPrj', N'ON'
GO
ALTER DATABASE [AssignmentPrj] SET QUERY_STORE = OFF
GO
USE [AssignmentPrj]
GO
/****** Object:  Table [dbo].[account] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[userID] [int] IDENTITY(0,1) NOT NULL,
	[userName] [nvarchar](30) NOT NULL,
	[userPhone] [nvarchar](15) NULL,
	[password] [nvarchar](30) NOT NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[cateID] [int] NOT NULL,
	[cateName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[total] [int] NOT NULL,
	[date] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetail] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetail](
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_orderDetail] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[image] [nvarchar](200) NOT NULL,
	[price] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[cateID] [int] NOT NULL,
	[sellerID] [int] NOT NULL,
 CONSTRAINT [PK__product__3213E83FEB5C3C3B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([userID], [userName], [userPhone], [password], [isAdmin]) VALUES (1, N'huynhnguyen', N'0763002783', N'2002', 0)
INSERT [dbo].[account] ([userID], [userName], [userPhone], [password], [isAdmin]) VALUES (2, N'ngocnhi', N'0902410757', N'1998', 0)
INSERT [dbo].[account] ([userID], [userName], [userPhone], [password], [isAdmin]) VALUES (3, N'huynhphuoc', N'0987654321', N'1234', 0)
INSERT [dbo].[account] ([userID], [userName], [userPhone], [password], [isAdmin]) VALUES (4, N'tuankiet', N'0123321123', N'4321', 0)
INSERT [dbo].[account] ([userID], [userName], [userPhone], [password], [isAdmin]) VALUES (5, N'admin0', N'0123456789', N'admin0', 1)
INSERT [dbo].[account] ([userID], [userName], [userPhone], [password], [isAdmin]) VALUES (6, N'admin1', N'0987654321', N'admin1', 1)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
INSERT [dbo].[category] ([cateID], [cateName]) VALUES (1, N'Sữa bột cho bé')
INSERT [dbo].[category] ([cateID], [cateName]) VALUES (2, N'Ăn dặm, dinh dưỡng')
INSERT [dbo].[category] ([cateID], [cateName]) VALUES (3, N'Thời trang cho bé')
INSERT [dbo].[category] ([cateID], [cateName]) VALUES (4, N'Bỉm tã')
INSERT [dbo].[category] ([cateID], [cateName]) VALUES (5, N'Đồ chơi, học tập')
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (2, N'Sữa Similac 5G', N'https://cdn.concung.com/2022/10/59415-93814/sua-similac-5g-so-4-1-7kg-2-6-tuoi.jpg', 815000, N'Sữa Bột Abbott', 12, 1, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (3, N'Sữa Aptamil Profutura', N'https://cdn.concung.com/2022/10/59274-93424/san-pham-dinh-duong-cong-thuc-aptamil-profutura-duobiotik-2-danh-cho-tre-tu-6-12-thang-tuoi-800g.jpg', 780000, N'Sữa Bột Aptamil', 20, 1, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (4, N'Combo 2 Sữa GrowPlus', N'https://cdn.concung.com/2022/06/57818-89515/sua-growplus-do-1-5kg-tu-1-tuoi.jpg', 1098000, N'Sữa Bột GrowPlus+', 11, 1, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (5, N'Sữa Friso Gold', N'https://cdn.concung.com/2021/10/51153-75771/friso-gold-4-2-6-tuoi-1400gr.jpg', 675000, N'Sữa Bột Friso', 29, 1, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (6, N'Bột Sữa Non Colomi', N'https://cdn.concung.com/2021/10/52352-76002/colomi-200g.jpg', 435000, N'Sữa Non Colomi', 16, 1, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (7, N'Dầu Ô-liu Dinh Dưỡng Cho Trẻ Em', N'https://cdn.concung.com/2022/10/59353-93688/dau-o-liu-dinh-duong-cho-tre-em-nhan-hieu-kiddy-250-ml.jpg', 150000, N'Dầu Dinh Dưỡng Kiddy', 22, 2, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (8, N'Fruit Me Up', N'https://cdn.concung.com/2022/10/59545-94071/fruit-me-up-nuoc-ep-thach-dau-tui-90g-fruit-me-up-strawberry-jelly-juice-90g.png', 23000, N'Nước Ép Thạch', 17, 2, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (9, N'Váng Sữa Uống Zott Monte Hương Vani', N'https://cdn.concung.com/2022/03/55769-83932/vang-sua-uong-zott-monte-huong-vani-4x95ml.jpg', 59000, N'Váng Sữa Zott Monte', 10, 2, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (10, N'Rong Biển Hữu Cơ', N'https://cdn.concung.com/2022/01/54589-79357/rong-bien-huu-co-an-lien-ispoon.jpg', 89000, N'Rong Biển Ispoon', 1, 2, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (11, N'Phô mai tươi trái cây vị vani', N'https://cdn.concung.com/2020/01/44245-55292/pho-mai-tuoi-trai-cay-helio-vi-vani-dau-helio-fruity-fresh-cheese-strawberry-vanilla-50g-loc-4.jpg', 50000, N'Phô Mai Helio', 11, 2, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (12, N'Combo 2 Xúc Xích Tiệt Trùng', N'https://cdn.concung.com/2022/07/58168-90574/xuc-xich-ca-va-pho-mai.jpg', 64000, N'Xúc Xích Goldkids', 9, 2, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (13, N'Sandal Bé Trai', N'https://cdn.concung.com/2022/10/59448-93893/sandal-be-trai-animo-a2203-jk003-19-nhieu-mau.jpg', 149000, N'Giày Animo', 8, 3, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (14, N'Sandal Bé Gái', N'https://cdn.concung.com/2022/10/59460-93898/giay-be-gai-animo-a2203-jk004-19-trang.jpg', 149000, N'Giày Animo', 15, 3, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (15, N'Đầm Thun Bé Gái', N'https://cdn.concung.com/2020/09/47237-64669/dam-thun-be-gai-cf-g0820015-1-2y-trang.jpg', 99000, N'Đầm Trẻ Em CF', 9, 3, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (16, N'Quần Jean Bé Gái', N'https://cdn.concung.com/2020/10/48063-66061/quan-jeans-be-gai-dai-cf-g0720007-5y-xanh.jpg', 119000, N'Quần Jean Trẻ Em CF', 4, 3, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (17, N'Áo Bé Trai Tay Ngắn', N'https://cdn.concung.com/2021/04/51023-72337/ao-be-trai-tay-ngan-mrn-cf-b0321002-6-9m-vang.jpg', 64000, N'Áo Trẻ Em MRN CF', 21, 3, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (18, N'Combo 2 Nón Sơ Sinh', N'https://cdn.concung.com/2021/11/46614-77685/non-so-sinh-bo-2-cai-cf-i129015-1-trang.jpg', 24000, N'Nón Trẻ Em CF', 2, 3, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (19, N'Bỉm Tã Quần Size XXL 26 Miếng', N'https://cdn.concung.com/2019/09/26898-52402/bim-ta-quan-merries-xxl-15-28kg-26-mieng.jpg', 339000, N'Bĩm Trẻ Em Merries', 15, 4, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (20, N'ComBo 2 Bỉm Tã Quần Size L', N'https://cdn.concung.com/2022/03/44987-85307/combo-2-ta-quan-huggies-dry-pants-goi-cuc-dai-l-9-14kg-68-mieng.jpg', 690000, N'Bĩm Trẻ Em Huggies', 4, 4, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (21, N'Bỉm Tã Quần Size XXL 30 Miếng', N'https://cdn.concung.com/2022/04/42697-86964/bim-ta-quan-bobby-xxl-56-mieng.jpg', 325000, N'Bĩm Trẻ Em Bobby', 11, 4, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (22, N'Bỉm Tã Dán Thiên Nhiên', N'https://cdn.concung.com/2022/01/54921-79372/bim-ta-dan-molfix-thien-nhien-xs-5kg-72-mieng.jpg', 159000, N'Bĩm Trẻ Em Molfix', 10, 4, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (23, N'Tã Quần Size XL', N'https://cdn.concung.com/2022/06/57940-89808/ta-quan-elprairie-air-wing-xl-12-17kg-6-mieng.jpg', 44000, N'Tã Quần Elprairie', 9, 4, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (24, N'Bộ Đồ Chơi Đất Nặn ', N'https://cdn.concung.com/2020/05/45474-60499/bo-do-choi-dat-nan-huong-nghiep-play-doh-e3342.jpg', 174000, N'Đồ Chơi Đất Nặn', 2, 5, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (25, N'Bộ Khuôn Nặn Hình', N'https://cdn.concung.com/2018/11/39328-43638/bo-khuon-nan-hinh-donerland-fb01031.jpg', 19000, N'Đồ Chơi Nặn Hình', 10, 5, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (26, N'Thú Nhồi Bông Mèo', N'https://cdn.concung.com/2021/11/52888-77800/thu-nhoi-bong-meo-cosplay-ca-map-lon.jpg', 88000, N'Thú Nhồi Bông Toycity', 2, 5, 5)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [quantity], [cateID], [sellerID]) VALUES (30, N'Đồ Chơi Nhà Tạo Mẫu Tóc', N'https://cdn.concung.com/2022/02/55390-81694/bup-be-nha-tao-mau-toc-yg1903-1-ept644189-1.jpg', 108000, N'Đồ Chơi Búp Bê Toycity', 3, 5, 5)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_account1] FOREIGN KEY([userId])
REFERENCES [dbo].[account] ([userID])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_account1]
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_orderDetail_order] FOREIGN KEY([orderId])
REFERENCES [dbo].[order] ([orderId])
GO
ALTER TABLE [dbo].[orderDetail] CHECK CONSTRAINT [FK_orderDetail_order]
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_orderDetail_product] FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[orderDetail] CHECK CONSTRAINT [FK_orderDetail_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_account1] FOREIGN KEY([sellerID])
REFERENCES [dbo].[account] ([userID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_account1]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category1] FOREIGN KEY([cateID])
REFERENCES [dbo].[category] ([cateID])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category1]
GO
USE [master]
GO
ALTER DATABASE [AssignmentPrj] SET  READ_WRITE 
GO
