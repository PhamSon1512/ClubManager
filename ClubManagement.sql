Create database ClubManagement
go
use ClubManagement
go
-- Bảng 'setting'
CREATE TABLE setting (
    setting_id INT PRIMARY KEY,
    name NVARCHAR(255),
    type NVARCHAR(50),
    description NVARCHAR(MAX),
    status bit,
);
GO

INSERT INTO setting (setting_id , [name], type, description, status)
VALUES (1 ,'User Active', 'user', 'User setting', 1);

INSERT INTO setting (setting_id, [name], type, description, status)
VALUES (0, 'User Deactive', 'user', 'User setting', 0);

INSERT INTO setting (setting_id, name, [type], description, status)
VALUES (2, 'User Banned', 'user', 'User setting', 2);



-- Bảng 'user'
CREATE TABLE [user] (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name NVARCHAR(35) NOT NULL,
    user_name NVARCHAR(35) UNIQUE,
    email NVARCHAR(50) NOT NULL UNIQUE,
    phone_number NVARCHAR(20) NULL, 
    password NVARCHAR(255) NOT NULL,
    avatar_url NVARCHAR(255),
    setting_id INT,
    status TINYINT,
    note NVARCHAR(MAX),
    verified bit not null,
    FOREIGN KEY (setting_id) REFERENCES setting(setting_id)
);
GO

INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES (N'Phạm Quý Đôn', N'Phạm Quý Đôn', N'donpqhe172396@fpt.edu.vn', N'123', N'RG9uMjIwNTIwMDM=', N'assets/uploads/448558152_1646060499474113_4456132537420746816_n_886f27ab-85c4-4151-911e-08079f5b98c4.jpg', 1, 2, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES (N'Phạm Đôn', N'Phạm Đôn', N'phamdon2003@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES (N'Phạm Quý Đôn', N'Phạm Quý Đôn543', N'donuchiha225@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES (N'Đôn', N'Đôn', N'phamdon870@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 2, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES (N'Son', N'Son', N'sodoku18@gmail.com', NULL, N'MTUxMjIwMDNhWg==', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES (N'Đỗ Văn Mạnh', N'Đỗ Văn Mạnh', N'fptuclubs@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 1, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES (N'Nguyen Van A', N'Nguyen Van A', N'don123@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES (N'Nguyen Van B', N'Nguyen Van B', N'don23@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES ( N'Đỗ Văn Mạnh', N'Đỗ Văn Mạnh783', N'manh1234beo@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES (N'Quý Đôn ', N'Quý Đôn ', N'phamdon22052003@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES ( N'Nguyễn Xuân Chiến ', N'Nguyễn Xuân Chiến ', N'chiennxhe123456@fpt.edu.vn', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES ( N'Phạm Sơn', N'Phạm Sơn', N'sonpt1512@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES ( N'Nguyen Van C', N'Nguyen Van C', N'Cnguyen123@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES ( N'Nguyen Van D', N'Nguyen Van D', N'Dnguyen2003@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES ( N'Đỗ Văn Mạnh', N'Đỗ Văn Mạnh969', N'phamdon20032@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES ( N'Phạm Đôn', N'Phạm Đôn117', N'phamdon8700@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES ( N'PhạmQĐôn', N'PhạmQĐôn', N'manh1235beo@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES ( N'Minh Đại ', N'Minh Đại ', N'mindai2003@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES ( N'Đại', N'Đại', N'donuchiha2250@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES ( N'Phạm Quý Đôn', N'Phạm Quý Đôn148', N'donuchiha2252@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)
INSERT [dbo].[user] ([full_name], [user_name], [email], [phone_number], [password], [avatar_url], [setting_id], [status], [note], [verified]) VALUES ( N'Đỗ Văn Mạnh', N'Đỗ Văn Mạnh934', N'manh1231beo@gmail.com', NULL, N'RG9uMjIwNTIwMDM=', NULL, 1, 0, NULL, 1)

-- Bảng 'club_category'
CREATE TABLE club_category (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
	setting_id int foreign key references setting(setting_id)
)

Insert [dbo].[club_category]([name]) values (N'Art'), (N'Sport'), (N'Educational')

-- Bảng 'club'
CREATE TABLE club (
    club_id INT IDENTITY(1,1) PRIMARY KEY,
    code NVARCHAR(255) NOT NULL UNIQUE,
    name NVARCHAR(255) NOT NULL,
	category_id INT,
    description NVARCHAR(MAX),
    status TINYINT,
    imageUrl nvarchar(MAX),
	numberPhone nvarchar(20),
	facebook nvarchar(255),
    FOREIGN KEY (category_id) REFERENCES club_category(category_id)
);
GO

INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES (N'CLB Âm Nhạc Đại Học FPT', N'FPTU - Melody Club', 1, N'🎼 CLB Âm Nhạc Đại học FPT Hà Nội: 𝐅𝐏𝐓𝐔 - 𝐌𝐞𝐥𝐨𝐝𝐲 𝐂𝐥𝐮𝐛 🎼 
Nơi hội tụ những thành viên có sở thích, đam mê với ca hát và âm nhạc. Tạo sân chơi âm nhạc: Xây dựng một môi trường thân thiện, nơi các bạn trẻ có thể giao lưu, học hỏi và thể hiện tài năng âm nhạc.
-----------------------------------
🎹', 1, N'img/melody.jpg', N'0975350155', N'https://www.facebook.com/fptu.melody.club')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES ( N'CLB Guitar Trường Đại Học FPT', N'FPT UNIVERSITY GUITAR CLUB', 1, N'CLB Guitar Trường Đại Học FPT, hay còn được biết đến với tên gọi FPT University Guitar Club, là nơi tuyệt vời cho những ai đam mê âm nhạc và đặc biệt là đàn guitar tại FPT University. Với sứ mệnh khơi dậy niềm đam mê âm nhạc, CLB không chỉ là nơi để học hỏi kỹ năng chơi guitar mà còn là môi trường để các thành viên chia sẻ, giao lưu và trải nghiệm cùng nhau.', 1, N'img/guitar.jpg', N'0868662061', N'https://www.facebook.com/fuguitarclub')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES ( N'CLB múa HeBe Trường Đại học FPT', N'CLB Hebe - FPT University', 1, N'

CLB Múa HeBe tại Trường Đại học FPT là một tổ chức nổi bật trong cộng đồng sinh viên với sứ mệnh khuyến khích và phát triển nghệ thuật múa trong môi trường học thuật sáng tạo. Với tôn chỉ "Nâng tầm nghệ thuật - Kết nối đam mê", CLB không chỉ là nơi để các bạn sinh viên rèn luyện kỹ năng múa mà còn là một không gian giao lưu, trao đổi và phát triển bản thân.', 1, N'img/hebe.jpg', N'0969097238', N'https://www.facebook.com/HebeFPT')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES (N'| B R A N C H É |', N'B R A N C H É Club - FPT University', 1, N'
Các hoạt động của | B R A N C H É | tập trung vào việc khơi nguồn cảm hứng từ các xu hướng thời trang mới nhất và các phong cách mẫu mới, đồng thời khuyến khích thành viên thể hiện cá tính riêng của họ thông qua nghệ thuật mô hình và biểu diễn. Câu lạc bộ cũng thường xuyên tổ chức các buổi chụp hình, trình diễn thời trang và tham gia các sự kiện văn hóa nghệ thuật tại trường và cộng đồng.', 1, N'img/branche.jpg', N'0888600902', N'https://www.facebook.com/branche.fptu.vietnam')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES (N'FEC không phải một Câu lạc bộ học thuật đơn thuần mà là nơi những con người tử tế cùng nhau cố gắng.', N'FEC - FPTU English Club ', 3, N'FEC - FPTU English Club là một câu lạc bộ tiếng Anh tại Đại học FPT (FPT University) tại Việt Nam, nơi sinh viên có cơ hội cải thiện và thực hành kỹ năng tiếng Anh của mình thông qua các hoạt động giao tiếp, học tập và vui chơi. Các bài viết có liên quan đến tiếng Anh với nội dung song ngữ để các bạn vừa giải trí vừa học thêm thứ ngôn ngữ rất đỗi thông dụng và đặc sắc này!', 1, N'img/FEC.jpg', N'0962598165', N'https://www.facebook.com/englishclub.fu')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES (N'JS Club là câu lạc bộ Kỹ sư phần mềm Nhật Bản, nơi hội tụ của những người bạn đam mê lập trình', N'JS Club - Japanese Software Engineers ', 3, N'JS Club (Câu lạc bộ Kỹ sư phần mềm Nhật Bản) là tổ chức chuyên nuôi dưỡng cộng đồng những người đam mê công nghệ phần mềm tại Đại học FPT. Nó cung cấp một nền tảng cho sinh viên quan tâm đến thực tiễn, công nghệ và văn hóa phát triển phần mềm của Nhật Bản.', 1, N'img/JS.jpg', N'0344265925', N'https://www.facebook.com/fu.jsclub')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES (N'AI Club là CLB Trí tuệ Nhân tạo đầu tiên của FPTU', N'FPTU AI Club - Artificial Intelligence Researchers ', 3, N'Câu lạc bộ AI FPTU, tên chính thức là Câu lạc bộ các nhà nghiên cứu trí tuệ nhân tạo tại Đại học FPT, là tổ chức dành riêng cho sinh viên đam mê khám phá và phát triển lĩnh vực Trí tuệ nhân tạo (AI). Câu lạc bộ này đóng vai trò là nền tảng để các thành viên tham gia học tập, nghiên cứu và ứng dụng thực tế các công nghệ AI', 1, N'img/AI.png', N'0383238586', N'https://www.facebook.com/aiclub.fptu')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES (N'CLB Tiếng Trung - Đại Học FPT ', N'FCC - FPT Chinese Club', 3, N'Câu lạc bộ tiếng Trung FPT nhằm mục đích làm phong phú thêm trải nghiệm của sinh viên bằng cách cung cấp các cơ hội giáo dục hấp dẫn để học tiếng Trung và khám phá nền văn hóa sôi động của ngôn ngữ này trong cộng đồng đại học.', 1, N'img/FCC.jpg', N'
033 992 1550', N'https://www.facebook.com/tiengtrungFPT')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES (N'No Shy Club - English Speaking & Soft Skill Club of FPT University ', N'No Shy Club ', 3, N'No Shy Club được thành lập nhằm tạo ra một môi trường cởi mở, trong đó các thành viên có nhiều cơ hội trau dồi bản thân về ngôn ngữ & các kỹ năng mềm khác. Nơi các thành viên có thể nâng cao khả năng ngôn ngữ và các kỹ năng mềm khác mà không phải đắn đo hay ngại ngùng.', 1, N'img/Noshy.jpg', N'', N'https://www.facebook.com/noshyclub')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES ( N'CLB Kinh Doanh trực thuộc Đại học FPT', N'FPTU Business Club - FBC  ', 3, N'FPTU Business Club là nơi để tất cả thành viên không chỉ được hết mình đóng góp ý tưởng với những dự án kinh doanh sáng tạo, độc đáo; được trau dồi thêm kiến thức về chuyên môn mà còn là nơi để mọi người có thể giúp đỡ lẫn nhau cả trong lĩnh vực học tập, cuộc sống. Nơi mà tất cả mọi người hoạt động như một gia đình, qua những buổi giao lưu sinh hoạt để các thành viên thấu hiểu về nhau hơn.', 1, N'img/Busi.jpg', N'
098 167 06 74', N'https://www.facebook.com/FU.Business')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES ( N'Câu lạc bộ bóng đá Đại học FPT HN- FPT', N'FOOTBALL CLUB', 2, N'Câu lạc bộ bóng đá đại học FPT viết tắt là FFC. FFC là viết tắt của  FPT FOOTBALL CLUB được thành lập vào năm 2014. Đây là câu lạc bộ bóng đá độc nhất của trường đại học FPT với đông đảo các thành viên tham gia trong 3 năm trở lại đây. Các thành viên tham gia bao gồm sinh viên, cán bộ đã và đang học tập, làm việc tại trường đại học FPT, Hà Nội. Câu lạc bộ được thành lập nên nhằm tạo ra sân chơi cho những người đam mê môn thể thao vua. Ở đây mọi người được tham gia nhiều hoạt động bổ ích xung quanh trái bóng tròn. Câu lạc bộ như một mái nhà thứ 2 giúp sinh viên cán bộ rèn luyện sức khỏe, gắn kết, đùm bọc lẫn nhau khi xa nhà.', 1, N'img/football.jpg', N'', N'https://www.facebook.com/FPTU.FC')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES ( N'FVC Hòa Lạc ', N'FPTU Vovinam Club', 2, N' FPTU Vovinam Club (FVC) là câu lạc bộ võ thuật của trường Đại học FPT, được thành lập từ 6/6/2009. Là một trong những CLB lâu đời và có bảng thành tích nhiều nhất nhì xứ Hola, FVC luôn giữ trong mình tinh thần võ đạo và nhiệt huyết, gắn liền với slogan "Pain is temporary - Glory lasts forever".', 1, N'img/vovinam.jpg', N'', N'https://www.facebook.com/fvchn')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES ( N'CLB dành cho các bạn có đam mê bộ môn Street Workout/Calisthenics tại ĐH FPT Hà Nội ', N'FU Street Workout ', 2, N'💪 Được thành lập vào 2/5/2016, FU Street Workout là nơi giúp các bạn, đặc biệt là các bạn sinh viên trường ĐH FPT Hà Nội nâng cao sức khỏe, rèn luyện cùng nhau sau những giờ học căng thẳng.

💪 Vào mỗi buổi chiều tại khu xà lớn nhất nhì Đông Nam Á, không thể thiếu được những màn biểu diễn ngẫu hứng, những nhóm bạn trẻ cùng tập luyện, trở thành một điểm giao lưu, truyền cảm hứng về việc tập luyện thể thao trong khuôn viên Hòa Lạc Campus.', 1, N'img/sw.jpg', N'096 689 71 84', N'https://www.facebook.com/FuStreetWorkout')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES ( N'Nơi sinh hoạt hàng tuần của các thanh niên máu me quần đùi áo số tranh nhau quả bóng cam ở FPT Hà Nội tại Hòa Lạc ', N'FPTU Basketball Club ', 2, N'FPTU Basketball Club là một câu lạc bộ bóng rổ hoạt động tại Đại học FPT (FPT University) tại Việt Nam. Được thành lập với mục đích khuyến khích sinh viên tham gia vào hoạt động thể thao, đặc biệt là môn bóng rổ, câu lạc bộ này cung cấp một môi trường thân thiện và năng động để các thành viên có thể rèn luyện kỹ năng, giao lưu với nhau và thể hiện đam mê với môn thể thao này.', 1, N'img/basketball.jpg', N'081 367 0874', N'https://www.facebook.com/FPTBasketballClub')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES ( N'Nơi những con người yêu thích vẻ đẹp hình thể và sức mạnh của FU tụ họp ', N'FU Gymnastic ', 2, N'Thời điểm thành lập CLB: 11/09/2014 
💪FU Gymnastic - cộng đồng những người có niềm yêu thích bộ môn Gym, mong muốn thay đổi & phát triển bản thân cả thể chất lẫn tinh thần. Một cộng đồng cùng nhau luyện tập, cùng nhau học hỏi và cùng nhau tận hưởng tuổi trẻ.
🔥Lời nhắn nhủ từ FU Gymnastic: 
“Bỏ điện thoại xuống, cầm tạ lên !!!” ', 1, N'img/gym.jpg', N' 0794172736', N'https://www.facebook.com/FuGymnastic')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES ( N'Câu lạc bộ võ thuật Muay Thái', N'FMUC - FPTU Muay Club ', 2, N'
FPTU Muay Club (FMUC) là một câu lạc bộ võ thuật trực thuộc trường Đại học FPT, chuyên về Muay Thái, một môn võ có nguồn gốc từ Thái Lan. Câu lạc bộ không chỉ là nơi rèn luyện thể lực và kỹ năng chiến đấu mà còn là môi trường giúp sinh viên phát triển tinh thần thể thao, ý chí kiên cường và kỷ luật bản thân.', 1, N'img/muay.jpg', N'0865595505', N'https://www.facebook.com/fmuc.fptu')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES ( N'FNC - FPTU Nunchaku Club (23/05/2019) là nơi hội tụ của những người có cùng chung đam mê với Côn Nhị Khúc', N'FNC - FPTU Nunchaku Club  ', 2, N'

Thời điểm thành lập CLB: 23/5/2019
🏆 FNC - FPTU Nunchaku CLub là ngôi nhà chung cho những bạn có niềm đam mê với Côn Nhị Khúc, gắn kết tất cả mọi người với nhau và cùng nhau phát triển không ngừng.
🔥 Lời nhắn nhủ từ FNC - FPTU Nunchaku CLub: 
“FNC có hashtag điển hình là #KeepTheFireBurning vì vậy nên chúng mình muốn nhắn nhủ đến các bạn sinh viên Đại Học FPT là hãy luôn thắp sáng và giữ ngọn lửa đam mê bên trong mình. Là Cóc nhà Ép Pê Tê hãy cháy hết mình cho những gì mình đang làm nhé. ', 1, N'img/nunchaku.jpg', N'
037 341 3646', N'https://www.facebook.com/nunchaku.fnc')
INSERT [dbo].[club] ([code], [name], [category_id], [description], [status], [imageUrl], [numberPhone], [facebook]) VALUES (N'Câu lạc bộ TAEKWONDO của Trường Đại Học FPT Hà Nội', N'FPTU Taekwondo Club ', 2, N'Thời điểm thành lập CLB: 24/4/2018
🙆Là một CLB được tạo nên từ niềm đam mê mãnh liệt với bộ môn võ Taekwondo, đồng thời cũng tạo ra sân chơi cho các bạn sinh viên có cùng sở thích để giao lưu,học hỏi và phát triển bản thân.
🔥Lời nhắn nhủ của CLB Taekwondo:
“FTC không chỉ là một CLB mà còn là nhà, là nơi mà không một ai bị bỏ lại phía sau 💕”', 1, N'img/taekwondo.jpg', N'0972892463', N'https://www.facebook.com/FTCTaekwondo')

-- Bảng 'club_member'
CREATE TABLE club_member (
    club_id INT,
    user_id INT,
	email nvarchar(50) not null,
    speciality_id INT,
    request_note NVARCHAR(MAX),
    status TINYINT,
	active_status bit not null,
    PRIMARY KEY (club_id, user_id, speciality_id),
    FOREIGN KEY (club_id) REFERENCES club(club_id),
    FOREIGN KEY (user_id) REFERENCES [user](user_id)
);
GO

INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (1, 1, N'donpqhe172396@fpt.edu.vn', 1, 2, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (1, 2, N'phamdon2003@gmail.com', 2, 1, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (1, 3, N'donuchiha225@gmail.com', 2, 1, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (1, 5, N'phamdon870@gmail.com', 2, 1, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (1, 8, N'don123@gmail.com', 2, 1, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (1, 9, N'don23@gmail.com', 3, 1, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (1, 10, N'manh1234beo@gmail.com', 4, 1, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (1, 11, N'phamdon22052003@gmail.com', 5, 1, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (1, 12, N'chiennxhe123456@fpt.edu.vn', 2, 1, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (1, 13, N'sonpt1512@gmail.com', 2, 1, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (1, 14, N'Cnguyen123@gmail.com', 6, 1, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (1, 15, N'Dnguyen2003@gmail.com', 4, 1, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (1, 18, N'manh1235beo@gmail.com', 3, 1, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (2, 2, N'phamdon2003@gmail.com', 2, 1, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (2, 3, N'donuchiha225@gmail.com', 2, 1, 1)
INSERT [dbo].[club_member] ([club_id], [user_id], [email], [speciality_id], [status], [active_status]) VALUES (2, 5, N'phamdon870@gmail.com', 2, 2, 1)

--Bảng 'club_registration'
CREATE TABLE club_registration (
    registration_id INT IDENTITY(1,1) PRIMARY KEY,
    club_id INT NOT NULL,
    name NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL,
    purpose NVARCHAR(MAX),
    committees NVARCHAR(MAX),
    description NVARCHAR(MAX),
    status NVARCHAR(50) DEFAULT 'pending',
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (club_id) REFERENCES club(club_id)
);
GO

INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'donpqhe172396@fpt.edu.vn', N'học tập , giải trí', N'chuyen mon', N'dddddd', N'accepted', CAST(N'2024-07-09T20:16:32.120' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'donpqhe172396@fpt.edu.vn', N'học tập , giải trí', N'chuyen mon', N'adfs', N'accepted', CAST(N'2024-07-09T20:16:43.800' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'donpqhe172396@fpt.edu.vn', N'học tập , giải trí', N'chuyen mon', N'hjjhjhjh', N'accepted', CAST(N'2024-07-09T20:23:10.687' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'donpqhe172396@fpt.edu.vn', N'học tập , giải trí', N'chuyen mon', N'hjjhjhjh', N'accepted', CAST(N'2024-07-09T20:24:16.933' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'chuyen mon', N'cdsv', N'accepted', CAST(N'2024-07-09T20:27:29.113' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'chuyen mon', N'cdsv', N'accepted', CAST(N'2024-07-09T20:27:29.257' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'chuyen mon', N'cdsv', N'accepted', CAST(N'2024-07-09T20:27:29.467' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'chuyen mon', N'hh h', N'accepted', CAST(N'2024-07-09T20:27:38.993' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'chuyen mon', N'àdvfdb', N'accepted', CAST(N'2024-07-09T20:27:48.817' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'chuyen mon', N'fadgsf', N'accepted', CAST(N'2024-07-09T20:41:38.060' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'chuyen mon', N'fadgsf', N'accepted', CAST(N'2024-07-09T20:44:45.933' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'chuyen mon', N'fgsrhdg', N'accepted', CAST(N'2024-07-09T20:44:59.943' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'chuyen mon', N'faegrhtjyku', N'accepted', CAST(N'2024-07-09T21:00:23.803' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'chuyen mon', N'faegrhtjyku', N'accepted', CAST(N'2024-07-09T21:09:37.687' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'chuyen mon', N'fdsfb', N'accepted', CAST(N'2024-07-09T21:09:58.850' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'chuyen mon', N'fdsfb', N'accepted', CAST(N'2024-07-09T21:16:14.990' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'donpqhe172396@fpt.edu.vn', N'học tập , giải trí', N'chuyen mon', N'scdvsdtyf', N'accepted', CAST(N'2024-07-12T10:50:00.767' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'chuyen mon', N'hihi', N'accepted', CAST(N'2024-07-13T12:40:13.947' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'chuyen mon', N'dá', N'accepted', CAST(N'2024-07-13T12:45:36.253' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'chuyen mon', N'fdsgbdfhguk', N'accepted', CAST(N'2024-07-13T22:12:17.653' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'donpqhe172396@fpt.edu.vn', N'học tập , giải tríd', N'Ban Chuyen Mon', N'àd', N'rejected', CAST(N'2024-07-13T22:52:26.243' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Son', N'sodoku18@gmail.com', N'aaa', N'Ban Chuyen Mon', N'aaa', N'accepted', CAST(N'2024-07-15T11:00:59.350' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'hello my name is Don', N'accepted', CAST(N'2024-07-17T01:47:41.227' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'hello my name is Don', N'rejected', CAST(N'2024-07-17T01:48:32.437' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'hello
', N'rejected', CAST(N'2024-07-17T01:50:10.597' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'hello
', N'rejected', CAST(N'2024-07-17T01:55:10.290' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'hello
', N'rejected', CAST(N'2024-07-17T01:56:16.387' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'sfs', N'rejected', CAST(N'2024-07-17T01:56:34.230' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'sfs', N'rejected', CAST(N'2024-07-17T01:58:45.017' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'fdgsf', N'rejected', CAST(N'2024-07-17T01:59:09.527' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'vds', N'rejected', CAST(N'2024-07-17T02:00:36.670' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'fd', N'Ban Chuyen Mon', N' cx', N'rejected', CAST(N'2024-07-17T02:01:43.163' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'vd', N'Ban Chuyen Mon', N'vfd', N'rejected', CAST(N'2024-07-17T02:06:37.543' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'vd', N'Ban Chuyen Mon', N'vfd', N'rejected', CAST(N'2024-07-17T02:08:23.760' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'fas', N'rejected', CAST(N'2024-07-17T02:08:46.700' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'fas', N'rejected', CAST(N'2024-07-17T02:14:49.047' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'ấc', N'rejected', CAST(N'2024-07-17T02:15:13.790' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'gd', N'rejected', CAST(N'2024-07-17T02:16:14.240' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'gd', N'rejected', CAST(N'2024-07-17T02:17:03.143' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'fdsd', N'rejected', CAST(N'2024-07-17T02:17:35.097' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'donuchiha225@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'Xin chào!', N'accepted', CAST(N'2024-07-17T02:24:55.687' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'sodoku18@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'Tôi là Phạm Quý Đôn', N'rejected', CAST(N'2024-07-17T02:25:25.910' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'fptuclubs@gmail.com', N'trau dồi kĩ năng sống , luyện tập và tham gia các hoạt động xã hội ', N'Ban Chuyen Mon', N'Là sinh viên năm 3 của trường đại học FPT ', N'rejected', CAST(N'2024-07-17T02:26:25.240' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'xin chào tôi là sinh viên năm 3 trường đại học FPT', N'accepted', CAST(N'2024-07-17T02:59:15.210' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N' Em viết thư này để bày tỏ mong muốn được tham gia vào câu lạc bộ Melody và đồng hành cùng các anh chị và các bạn trong các hoạt động của câu lạc bộ.', N'accepted', CAST(N'2024-07-17T20:30:29.250' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (2, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N' Em viết thư này để bày tỏ mong muốn được tham gia vào câu lạc bộ [Tên Câu Lạc Bộ] và đồng hành cùng các anh chị và các bạn trong các hoạt động của câu lạc bộ.', N'accepted', CAST(N'2024-07-17T20:31:23.637' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (2, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N' Em viết thư này để bày tỏ mong muốn được tham gia vào câu lạc bộ [Tên Câu Lạc Bộ] và đồng hành cùng các anh chị và các bạn trong các hoạt động của câu lạc bộ.', N'accepted', CAST(N'2024-07-17T20:31:30.620' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (2, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'Ban Van Hoa', N'fddfhj', N'accepted', CAST(N'2024-07-17T20:32:23.160' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (2, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'Ban Van Hoa', N'fddfhj', N'rejected', CAST(N'2024-07-17T20:34:59.740' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (2, N'Phạm Đôn', N'phamdon2003@gmail.com', N'xz', N'Ban Chuyen Mon', N'xz', N'rejected', CAST(N'2024-07-17T20:36:27.557' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (2, N'Phạm Quý Đôn', N'donpqhe172396@fpt.edu.vn', N'học tập , giải trí', N'Ban Chuyen Mon', N'dgdfh', N'accepted', CAST(N'2024-07-17T20:51:06.457' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (2, N'Phạm Quý Đôn', N'donuchiha225@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'czcvzx', N'rejected', CAST(N'2024-07-17T21:00:38.880' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'cd', N'Ban Chuyen Mon', N'acdsd', N'rejected', CAST(N'2024-07-17T21:04:02.933' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Đôn', N'phamdon2003@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'áddsada', N'accepted', CAST(N'2024-07-17T21:48:29.243' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (2, N'Phạm Quý Đôn', N'donuchiha225@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'sdcv', N'accepted', CAST(N'2024-07-17T21:49:10.187' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'donuchiha225@gmail.com', N'fvfd g', N'Ban Chuyen Mon', N'dfd g', N'accepted', CAST(N'2024-07-17T21:49:25.217' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (2, N'Phạm Đôn', N'phamdon2003@gmail.com', N'dsg', N'Ban Chuyen Mon', N'fsgd', N'accepted', CAST(N'2024-07-17T21:49:54.407' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'ds', N'Ban Chuyen Mon', N'fsd', N'accepted', CAST(N'2024-07-17T21:52:59.280' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'don123@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'Xin chào', N'accepted', CAST(N'2024-07-18T09:39:15.253' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'don23@gmail.com', N'học tập , giải trí', N'Ban Van Hoa', N'xin chào ', N'accepted', CAST(N'2024-07-18T09:39:45.557' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'manh1234beo@gmail.com', N'trau dồi kinh nghiệm ', N'Ban Truyen Thong', N'xin chào quản lý ', N'accepted', CAST(N'2024-07-18T09:40:34.430' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đỗ Văn Mạnh', N'phamdon22052003@gmail.com', N'học tập , giải trí', N'Ban Hau Can', N'Xin chào quản lý ', N'accepted', CAST(N'2024-07-18T09:41:09.080' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Nguyễn Chiến ', N'chiennxhe123456@fpt.edu.vn', N'học tập , giải trí', N'Ban Chuyen Mon', N'Hello Manager', N'accepted', CAST(N'2024-07-18T09:41:47.110' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Sơn ', N'sonpt1512@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'Xin chào ', N'accepted', CAST(N'2024-07-18T09:42:21.633' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Nguyen Van C', N'Cnguyen123@gmail.com', N'Học hỏi ', N'Ban Noi Dung', N'XIn chào mọi người ', N'accepted', CAST(N'2024-07-18T09:44:14.747' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Phạm Quý Đôn', N'Dnguyen2003@gmail.com', N'học tập , giải trí', N'Ban Truyen Thong', N'Xin chào ', N'accepted', CAST(N'2024-07-18T09:44:41.970' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'PhạmQĐôn', N'manh1235beo@gmail.com', N'học tập , giải trí', N'Ban Van Hoa', N'Xin chào ', N'accepted', CAST(N'2024-07-18T09:47:22.873' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đỗ Văn Mạnh', N'manh1231beo@gmail.com', N'học tập , giải trí', N'Ban Van Hoa', N'dvsf', N'pending', CAST(N'2024-07-18T10:09:18.903' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đỗ Văn Mạnh', N'mindai2003@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'Xin chào ', N'pending', CAST(N'2024-07-18T10:10:24.213' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đỗ Văn Mạnh', N'donuchiha2250@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'Hello Manager', N'pending', CAST(N'2024-07-18T10:10:52.400' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đỗ Văn Mạnh', N'donuchiha2252@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'Xin chào quản lý , tên em là Đỗ Văn Mạnh', N'pending', CAST(N'2024-07-18T10:11:32.610' AS DateTime))
INSERT [dbo].[club_registration] ([club_id], [name], [email], [purpose], [committees], [description], [status], [created_at]) VALUES (1, N'Đôn', N'phamdon870@gmail.com', N'học tập , giải trí', N'Ban Chuyen Mon', N'Xin chào ', N'accepted', CAST(N'2024-07-18T11:03:17.290' AS DateTime))

--Bảng 'club register'
CREATE TABLE club_register (
    registration_id int identity(1,1) primary key,
    name nvarchar(100) not null,
    email nvarchar(50) not null,
    description nvarchar(max),
    image nvarchar(255) null,
    club_id int foreign key (club_id) references club(club_id),
    category_id int foreign key (category_id) references club_category(category_id)
 );
GO

--Bảng 'contact'
CREATE TABLE contact (
    contact_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL,
    message NVARCHAR(MAX) NOT NULL,
    responded BIT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    user_id INT,
    club_id INT,
    FOREIGN KEY (user_id) REFERENCES [user](user_id),
    FOREIGN KEY (club_id) REFERENCES club(club_id)
);

INSERT [dbo].[contact] ([full_name], [email], [message], [responded], [created_at], [updated_at], [user_id], [club_id]) VALUES ( N'Phạm Quý Đôn ', N'donpqhe172396@fpt.edu.vn', N'Hello Admin ', 1, CAST(N'2024-07-18T10:57:48.647' AS DateTime), CAST(N'2024-07-18T10:57:48.700' AS DateTime), NULL, NULL)
INSERT [dbo].[contact] ([full_name], [email], [message], [responded], [created_at], [updated_at], [user_id], [club_id]) VALUES (N'hjg', N'donpqhe172396@fpt.edu.vn', N'cvx', 0, CAST(N'2024-07-26T22:56:02.917' AS DateTime), CAST(N'2024-07-26T22:56:02.967' AS DateTime), NULL, NULL)
INSERT [dbo].[contact] ([full_name], [email], [message], [responded], [created_at], [updated_at], [user_id], [club_id]) VALUES (N'Phạm Quý Đôn ', N'donpqhe172396@fpt.edu.vn', N'dvf', 0, CAST(N'2024-07-27T12:34:11.300' AS DateTime), CAST(N'2024-07-27T12:34:11.333' AS DateTime), NULL, NULL)
INSERT [dbo].[contact] ([full_name], [email], [message], [responded], [created_at], [updated_at], [user_id], [club_id]) VALUES (N'Phạm Quý Đôn ', N'donpqhe172396@fpt.edu.vn', N'xin chào', 1, CAST(N'2024-07-27T12:55:37.430' AS DateTime), CAST(N'2024-07-27T12:55:37.447' AS DateTime), NULL, NULL)

--Bảng 'department'
CREATE TABLE department (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX),
    club_id INT NOT NULL,
    speciality_id INT NOT NULL,
    current_projects NVARCHAR(MAX),
    regular_meeting_schedule NVARCHAR(255),
    status TINYINT,
    FOREIGN KEY (club_id) REFERENCES club(club_id),

);
GO

INSERT [dbo].[department] ([name], [description], [club_id], [speciality_id], [current_projects], [regular_meeting_schedule], [status]) VALUES (N'Ban Chủ Nhiệm', N'Quản lý các hoạt động ngoại giao , sự kiện của câu lạc bộ
', 1, 1, N'𝐔𝐏 𝟐𝟎𝟐𝟒: 𝐃𝐈𝐀𝐑𝐘 𝐓𝐀𝐋𝐄𝐒S', N'thứ 3 hàng tuần', 1)
INSERT [dbo].[department] ([name], [description], [club_id], [speciality_id], [current_projects], [regular_meeting_schedule], [status]) VALUES (N'Ban Chuyên Môn', N'Phụ trách các hoạt động chuyên môn', 1, 2, N'𝐔𝐏 𝟐𝟎𝟐𝟒: 𝐃𝐈𝐀𝐑𝐘 𝐓𝐀𝐋𝐄𝐒', N'Thứ 4 hàng tuần', 1)
INSERT [dbo].[department] ([name], [description], [club_id], [speciality_id], [current_projects], [regular_meeting_schedule], [status]) VALUES (N'Ban Văn Hóa', N'Tổ chức các hoạt động văn hóa, giải trí', 1, 3, N'Sự kiện tổ chức tuyên truyền Văn Hóa câu lạc bộ ', N'Thứ 6 hàng tuần', 1)

-- Bảng 'event'
CREATE TABLE [event] (
    event_id INT IDENTITY(1,1) PRIMARY KEY,
    club_id INT,
    user_id INT,
    title nvarchar(255) null,
    content nvarchar(max) null,
    thumbnailUrl nvarchar(max) null,
    startDate date null,
    endDate date null,
    FOREIGN KEY (club_id) REFERENCES club(club_id),
    FOREIGN KEY (user_id) REFERENCES [user](user_id)
);
GO

CREATE TABLE [event_registration](
	[registration_id] [int] IDENTITY(1,1) primary key,
	[event_id] [int] NULL,
	[user_id] [int] NULL,
	[registration_date] [datetime] NULL,
	[status] [varchar](10) NULL,
	[notes] [text] NULL,
	[attendance] [bit] NULL,
	FOREIGN KEY (event_id) REFERENCES event(event_id),
	FOREIGN KEY (user_id) REFERENCES [user](user_id)
);
GO

-- Bảng 'task'
CREATE TABLE task (
    task_id INT IDENTITY(1,1) PRIMARY KEY,
    event_id INT NOT NULL,
    club_id INT NOT NULL,
    assigner_id INT NOT NULL,
    assignee_id INT NOT NULL,	
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (club_id) REFERENCES club(club_id),
    FOREIGN KEY (assigner_id) REFERENCES [user](user_id),
    FOREIGN KEY (assignee_id) REFERENCES [user](user_id)
);
GO

-- Bảng 'post'
CREATE TABLE post (
    post_id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    thumnail_url NVARCHAR(255) null,
    content NVARCHAR(MAX) not null,
	author_id INT null,
	created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
GO

INSERT [dbo].[post] ([title], [thumnail_url], [content], [author_id], [created_at], [updated_at]) VALUES (N'💞 GIAN HÀNG TRUYỀN THÔNG - CHECK IN BACKGROUND 💞', N'assets/uploads/450268387_1088017436205412_5204213769442358437_n_1721267164406.jpg', N'📸 Đến với gian hàng của Truyền Thông, Anh/Chị có thể có được những tấm ảnh check- in cực kỳ đặc sắc dưới bàn tay nghệ thuật của những tài năng thiên bẩm của Media nhà Mê.
---------------------------------------
📖 𝐔𝐏 𝟐𝟎𝟐𝟒: 𝐃𝐈𝐀𝐑𝐘 𝐓𝐀𝐋𝐄𝐒 📖
⏰ Thời gian: 18H00 ngày 13/07/2024 (Thứ 7)
📍 Địa điểm: Bay Coffee (Thạch Hoà, Thạch Thất, Hà Nội)
---------------------------------------
CLB Âm Nhạc Đại học FPT Hà Nội: 𝐅𝐏𝐓𝐔 - 𝐌𝐞𝐥𝐨𝐝𝐲 𝐂𝐥𝐮𝐛
🎹 Thông tin liên hệ:
Email: fu.melody.club@gmail.com
Facebook: https://www.facebook.com/fptu.melody.club
Instagram: https://www.instagram.com/fptu_melody_club
Trưởng BTC: Phạm Mai Yến Nhi
Tel: 0934337822', 1, CAST(N'2024-07-16T12:08:27.373' AS DateTime), CAST(N'2024-07-18T08:46:04.403' AS DateTime))

INSERT [dbo].[post] ([title], [thumnail_url], [content], [author_id], [created_at], [updated_at]) VALUES (N'💟 HOẠT ĐỘNG ĐẶC BIỆT CHỈ CÓ TẠI 𝐔𝐏 𝟐𝟎𝟐𝟒: 𝐃𝐈𝐀𝐑𝐘 𝐓𝐀𝐋𝐄𝐒 💟', N'assets/uploads/450589397_1090169852656837_989657764439326676_n.jpg', N'⭐ Đến với sự kiện tri ân vô cùng ý nghĩa của 𝐅𝐏𝐓𝐔 - 𝐌𝐞𝐥𝐨𝐝𝐲 𝐂𝐥𝐮𝐛 dành tặng cho các anh chị thành viên Gen 8 năm nay, 𝐔𝐏 𝟐𝟎𝟐𝟒 sẽ là cơ hội đặc biệt để các thành viên nhà Mê được gặp gỡ, kết nối cùng nhau ôn về những kỷ niệm, nhìn lại thanh xuân tươi đẹp.
✨ 𝐔𝐏 𝟐𝟎𝟐𝟒: 𝐃𝐈𝐀𝐑𝐘 𝐓𝐀𝐋𝐄𝐒 sẽ giúp đại gia đình nhà Mê được “sát lại gần nhau” qua những cuộc trò chuyện thân mật rồi cùng nhau hòa mình vào những mini game siêu bánh cuốn và đặc biệt sẽ được đắm chìm vào những ca khúc chứa đầy kỷ niệm. Không những vậy, các anh chị thành viên Gen 8 nhà Mê còn được nhận những món quà vô cùng dễ thương do chính tay các em của mình tạo nên nữa đó.
🔥 Hãy cùng chúng mình đón chờ những khoảnh khắc ấm áp, lung linh nhất tại bữa tiệc tri ân nhaaa.
---------------------------------------
CLB Âm Nhạc Đại học FPT Hà Nội: 𝐅𝐏𝐓𝐔 - 𝐌𝐞𝐥𝐨𝐝𝐲 𝐂𝐥𝐮𝐛
🎹 Thông tin liên hệ:
Email: fu.melody.club@gmail.com
Facebook: https://www.facebook.com/fptu.melody.club
Instagram: https://www.instagram.com/fptu_melody_club
Trưởng BTC: Phạm Mai Yến Nhi
Tel: 0934337822', 1, CAST(N'2024-07-16T12:09:28.910' AS DateTime), CAST(N'2024-07-18T08:46:31.660' AS DateTime))
INSERT [dbo].[post] ([title], [thumnail_url], [content], [author_id], [created_at], [updated_at]) VALUES (N'💪 STREET WORKOUT - BỘ MÔN HỘI TỤ CẢ “ĐỘC', N'assets/uploads/334052023_226889916404920_6869985121435933799_n.jpg', N'💪Street Workout/Calisthenics nói riêng và tất cả các bộ môn thể thao nói chung đều giúp chúng ta cải thiện sức khỏe, rèn luyện sự bền bỉ, dẻo dai, xây dựng lối sống lành mạnh. Nhưng khác với những bộ môn thể thao khác, Street Workout - hay còn gọi là bộ môn Thể dục đường phố, lại sở hữu những nét độc đáo, nổi bật riêng, biến việc tập luyện bộ môn này trở nên “chất" và “nghệ”.
💪“ĐỘC” TỪ PHƯƠNG PHÁP TẬP LUYỆN
👉Street Workout là 1 phương pháp tập luyện sử dụng chính trọng lượng cơ thể để cải thiện sức mạnh cơ bắp, sự bền bỉ, dẻo dai, khả năng giữ thăng bằng.
👉ĐIểm độc đáo của phương pháp này chính là không cần sử dụng đến tạ hay thiết bị tập luyện phức tạp nào, cũng không cần không gian tập luyện đặc thù. Chỉ cần một góc phòng ngủ cùng những vật dụng xung quanh như bàn ghế hay với những bậc thềm cầu thang là quá đủ để có một buổi “độ múi" chất lượng. Vì đây là một bộ môn sử dụng chính trọng lượng của cơ thể để tập luyện, người tập hoàn toàn có thể tập luyện để vượt qua rào cản, vượt qua giới hạn để đạt đến được phiên bản tốt nhất của bản thân.
💪“CHẤT” TRONG PHONG CÁCH TẬP LUYỆN
👉Street Workout là bộ môn thể thao thể hiện rõ cái tôi của người tập. Đây là sự kết hợp từ nhiều loại hình thể dục, thể hình và nhất là đề cao sự cá tính, phong cách của người tập. Người tập Street Workout hoàn toàn có thể thoải mái sáng tạo, thể hiện cái "chất" của bản thân qua từng động tác, chuyển động. 
😎Cùng tham gia bộ môn này và thể hiện phong cách riêng của chính mình nhé!', 1, CAST(N'2024-07-16T12:10:14.970' AS DateTime), CAST(N'2024-07-18T08:45:24.683' AS DateTime))
INSERT [dbo].[post] ([title], [thumnail_url], [content], [author_id], [created_at], [updated_at]) VALUES (N'MANG FGC ĐẾN SCHANNEL SHOWCASE NGAY! MANG FGC ĐẾN SCHANNEL SHOWCASE NGAY!', N'assets/uploads/449834838_1020222743441653_7968247596172445682_n.jpg', N'🔥 FU Guitar Club đã trở lại và mang đến cho các bạn một món quà kịch trần, bay phấp phới đây!!! Lần trở lại này sẽ đánh giá một cột mốc đáng nhớ cho tất cả những FGCer với tinh thần nhiệt huyết rực lửa, cháy bỏng nhất của đại gia đình FGC.

✨ FGC rất vui và hân hạnh khi được góp mặt trong Schannel Showcase! Mong nhận được sự ủng hộ của tất cả mọi người cho hành trình sắp tới của chúng mình.

🤨 Và giờ, cùng đón chờ xem FGC sẽ đốt cháy sân khấu tại Schannel Showcase thế nào tại Schannel - Kênh thông tin giải trí cho giới trẻ nhoéeee!

Designer: Dương Diễm Quỳnh
—————————
SCHANNEL SHOWCASE 🎼
Thông tin liên hệ:
Trưởng Ban Tổ Chức - Trần Hải Sơn: 0382991695
Trưởng Ban Đối ngoại - Vương Nam Cường: 0356896210', 1, CAST(N'2024-07-16T12:21:04.943' AS DateTime), CAST(N'2024-07-18T08:45:13.413' AS DateTime))
INSERT [dbo].[post] ([title], [thumnail_url], [content], [author_id], [created_at], [updated_at]) VALUES (N'[𝐈𝐍𝐅𝐋𝐀𝐌𝐄 𝐅𝐀𝐒𝐇𝐈𝐎𝐍 𝐒𝐇𝐎𝐖 𝟐𝟎𝟐𝟒: 𝐄𝐕𝐎𝐋𝐔𝐓𝐈𝐎𝐍] GIỚI THIỆU DÀN BAN GIÁM KHẢO “SANG - XỊN - MỊN” TẠI MODEL CASTING CALL', N'assets/uploads/438301480_753643713623237_2403937401897350472_n.jpg', N'👉 Đăng ký trở thành 𝐌𝐨𝐝𝐞𝐥 𝐈𝐍𝐅𝐋𝐀𝐌𝐄 𝐅𝐚𝐬𝐡𝐢𝐨𝐧 𝐒𝐡𝐨𝐰 𝟐𝟎𝟐𝟒: 𝐄𝐕𝐎𝐋𝐔𝐓𝐈𝐎𝐍 ngay tại: https://forms.gle/DdfXK4Hr2NVGhiQQ7
⏰ Thời hạn đóng đơn: 20h00, Thứ Năm, ngày 9 tháng 5 năm 2024.
_________________________________________

🔥 Những gương mặt Ban Giám Khảo tại buổi Casting Model của INFLAME Fashion Show 2024: EVOLUTION đã chính thức lộ diện. Cùng INFLAME soi profile “cực khủng” dàn Ban Giám Khảo “hót hòn họt” sẽ xuất hiện trong buổi Casting sắp tới nha!

✨ NGUYỄN HỢP
🔸 Top Model
🔸 Á quân Vietnam''s Next Top Model 2015
🔹 Cô chính là nhân vật đã từng làm mưa làm gió tại chương trình VNTM 2015 và VNTM All Stars 2017. Với nhiều năm kinh nghiệm trong lĩnh vực người mẫu, Nguyễn Hợp chính là người cầm trịch mảng chuyên môn trong dàn BGK tại buổi casting năm nay. Những lời khuyên của cô chắc chắn là những bài học quý giá dành cho các bạn tham gia casting INFLAME Fashion Show 2024 sắp tới, hãy nhớ take note lại nha!

✨ TRẦN HỮU TUẤN ANH
🔸 Chủ nhiệm Gen 2 CLB Branché - FPTU Fashion & Model Club
🔸 Trưởng ban tổ chức INFLAME Fashion Show 2023
🔹 Người anh yêu quý của đại gia đình Branché, nhân vật đứng đằng sau luôn dõi theo và sát sao trong các sự kiện lớn nhỏ của FPTU Fashion & Model Club từ trước tới nay. Anh là người đã có công rất lớn gây dựng nên sự kiện INFLAME Fashion Show 2023 cực kỳ thành công. Đến với mùa INFLAME Fashion Show 2024, anh Tuấn Anh sẽ là gương mặt giám khảo chỉ bảo tận tình cho các bạn model tại buổi Casting sắp diễn ra.

✨ ANH ĐÔ
🔸 Á Quân 1 The Face FPTU 2020
🔸 Trưởng ban model Gen 1 CLB Branché - FPTU Fashion & Model Club
🔹 Là chị đại của đại gia đình nhà B, người dẫn dắt các model đời đầu của FPTU Fashion & Model Club và cũng chính là model đã có màn thể hiện cực slay và để lại dấu ấn khó phai tại The Face FPTU 2020 và INFLAME Fashion Show 2023. Tại INFLAME Fashion Show 2024, chị Anh Đô ở vị trí ban giám khảo sẽ mang những trải nghiệm của mình để truyền đạt lại cho các bạn model tham gia tại buổi casting lần này.

💥 Hãy cùng bùng nổ chào đón dàn Ban Giám Khảo và lắng nghe những lời nhận xét vô cùng quý giá từ họ tại Model Casting Call - INFLAME Fashion Show 2024: EVOLUTION.
_________________________________________
INFLAME FASHION SHOW 2024: EVOLUTION
📌 Thời gian: 18h00 Thứ Ba, ngày 28 tháng 5 năm 2024.
📌 Địa điểm: Đường 30m, trường Đại học FPT Hà Nội.', 1, CAST(N'2024-07-16T12:22:28.117' AS DateTime), CAST(N'2024-07-18T08:45:00.827' AS DateTime))
INSERT [dbo].[post] ([title], [thumnail_url], [content], [author_id], [created_at], [updated_at]) VALUES (N'👑 [ẤN NHIỆM: LỜI CẢM ƠN]👑sss', N'assets/uploads/450589397_1090169852656837_989657764439326676_n_1721275837289.jpg', N'❤️‍ Vậy là sự kiện Sinh nhật x Chuyển giao GEN9 của FU Street Workout đã chính thức khép lại với nhiều cung bậc cảm xúc. Có thể thấy, đây là sự kiện được đại gia đình Street Workout tổ chức với sự tâm huyết và chu đáo đến từng chi tiết.
❤️‍ Ban tổ chức chúng mình xin gửi lời cảm ơn chân thành đến tất cả mọi người đã có mặt và cùng nhau tạo nên sự kiện vô cùng ý nghĩa này.
🥰 Cảm ơn các CLB khách mời đã đến tham dự và chung vui với FU Street Workout trong sự kiện quan trọng này.
🥰 Bên cạnh đó, xin được gửi lời cảm ơn sâu sắc đến các thành viên trong ban tổ chức đã luôn cố gắng, giúp đỡ lẫn nhau để sự kiện được diễn ra trọn vẹn nhất.
🥰 Cảm ơn đại gia đình FU Street Workout vì tất cả!
—--------------------------------
𝑴𝒐̣𝒊 𝒕𝒉𝒐̂𝒏𝒈 𝒕𝒊𝒏 𝒄𝒉𝒊 𝒕𝒊𝒆̂́𝒕 𝒙𝒊𝒏 𝒍𝒊𝒆̂𝒏 𝒉𝒆̣̂:
Fanpage: FU Street Workout
Email: fuswclub@gmail.com
Contact:
Trưởng ban BTC: Hoàng Long
Chủ nhiệm: Dương Thị Hanhss
Phó Chủ nhiệm: Nguyễn Minh Khoa', 1, CAST(N'2024-07-16T12:24:24.600' AS DateTime), CAST(N'2024-07-18T11:10:37.290' AS DateTime))

-- Bảng 'post_category'
CREATE TABLE post_category (
    post_id INT,
    setting_id INT,
    PRIMARY KEY (post_id, setting_id),
    FOREIGN KEY (post_id) REFERENCES post(post_id),
    FOREIGN KEY (setting_id) REFERENCES setting(setting_id)
);
GO

--Bảng 'comment'
CREATE TABLE comment (
    comment_id INT IDENTITY(1,1) PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    content NVARCHAR(MAX) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (post_id) REFERENCES post(post_id),
    FOREIGN KEY (user_id) REFERENCES [user](user_id)
);
GO

-- Bảng 'blog'
CREATE TABLE blog (
    blog_id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    thumnail_url NVARCHAR(255),
    content NVARCHAR(MAX),
    status TINYINT
);
GO

INSERT INTO [dbo].[blog]
           ([title], [thumnail_url], [content], [status])
     VALUES
           (N'Hành trình mang hơi ấm đến vùng cao trong dự án Áo Ấm Hà Giang 6 của iGo Club', N'https://hanoi.fpt.edu.vn/wp-content/uploads/2023/01/321447747_464117482565095_421106605371973044_n.jpeg', N'Trong những tháng cuối năm 2022, iGo Club đã thực hiện dự án Áo Ấm Hà Giang 6, đem đến cho trẻ em cùng cao hơn 1500 chiếc áo ấm và dụng cụ học tập mới. Cùng tìm hiểu chuyến hành trình hơn 400km của iGo nhé!

iGo Club là câu lạc bộ thiện nguyện của Trường Đại học FPT Hà Nội. Dự án Áo Ấm Hà Giang 6 được các thành viên của iGo club bắt đầu lên kế hoạch từ cuối tháng 8/2022. Từ tháng 10 đến đầu tháng 12/2022 CLB đã không ngừng tổ chức các hoạt động, sự kiện để gây quỹ từ thiện. Chuyến xe tình nguyện lăn bánh vào 17/12 và hoạt động xuyên suốt trong 7 ngày tại xã Sủng Cháng, huyện Yên Minh, Hà Giang, sau đó kết thúc vào ngày 24/12/2022. Ban tổ chức Áo Ấm Hà Giang 6 có 100 thành viên hoạt động tổ chức các chương trình gây quỹ. Nhưng do tính chất và đặc thù của chuyến tình nguyện xa nên Team chỉ đưa 40 tình nguyện viên cùng 3 cán bộ đồng hành từ phòng IC-PDP lên hoạt động tại Hà Giang.
iGo đã làm việc không ngừng nghỉ khi chương trình chính thức được phát động bằng chuỗi 06 hoạt động/ sự kiện gây quỹ gồm: 

Giải bóng đá gây quỹ thiện nguyện (FPTU Charity Football Tournament) - kết hợp với câu lạc bộ Bóng đá FFC
Sự kiện “Góp chữ cho em” - đến 05 điểm trường cấp 2,3 trên địa bàn Hà Nội để thu gom sách vở cho trẻ em Hà Giang
Chiến dịch gây quỹ “10K - Trường mới cho em” - Gây quỹ tu sửa hai điểm trường đã xuống cấp là “Mầm non Cháng Lộ” và “Tiểu học Mào Phố”  tại xã Sủng Cháng, huyện Yên Minh, Hà Giang.
Charity Month: Suất Cơm Yêu Thương - kết hợp với nhà dịch vụ số 2 Mango Foodcenter, đại học FPT Hà Nội tổ chức chương trình trích 10% mỗi suất cơm để góp cho quỹ “Áo Ấm Hà Giang 6”
Đêm nhạc Hola Vibes 4: Chuyện mùa đông - kết hợp với phòng Công tác sinh viên trường ĐH FPT Hà Nội
03 Music Show: Sing & Share - kết hợp với The Broker Coffee tổ chức 3 show nhạc thiện nguyện
Để mang tới chuyến thiện nguyện này, iGo cũng không quên nhắc tới những mạnh thường quân đã ủng hộ Áo Ấm Hà Giang 6: “Chúng em xin được gửi lời cảm ơn hơn 1500 người ủng hộ chương trình qua tài khoản thiện nguyện và hòm gây quỹ đã tạo động lực cho chúng em rất nhiều trong hành trình ý nghĩa này. Cảm ơn các mạnh thường quân, các bạn sinh viên, các nhà tài trợ đã tiếp sức, tạo động lực, lòng nhiệt huyết để chương trình được diễn ra thành công nhất.

Chúng em xin được gửi lời cảm ơn đến thầy cô, cán bộ xã tại xã Sủng Cháng - huyện Yên Minh - tỉnh Hà Giang đã tạo điều kiện và hết lòng giúp các tình nguyện viên trong thời gian qua. Và sau cùng, chúng mình xin được gửi lời cảm ơn tới các bạn tình nguyện viên đã nhiệt tình tham gia, hỗ trợ hết mình để tạo nên một chuyến tình nguyện xa thật ý nghĩa với vô vàn cảm xúc không thể nói thành lời". 

Vậy là chuyến thiện nguyện cuối cùng của năm 2022 đã mang đến rất nhiều nụ cười và niềm vui. Chúc iGo Club phát triển hơn nữa trong năm 2023, để tiếp tục mang đến những điều ý nghĩa cho cộng đồng!', 1);

INSERT INTO [dbo].[blog]
           ([title], [thumnail_url], [content], [status])
     VALUES
           (N'Khám phá CLB kinh doanh duy nhất tại Đại học FPT Hà Nội', N'https://hanoi.fpt.edu.vn/wp-content/uploads/2023/02/315091497_657564682551117_356952457047077101_n.jpeg', 
		   N'FPTU Business Club - CLB Kinh doanh duy nhất thuộc Đại học FPT Hà Nội, là bến đỗ hơn 10 năm  qua dành cho các sinh viên khối ngành Kinh tế nói riêng và sinh viên có niềm yêu thích với kinh doanh nói chung. Đây cũng là nơi để các bạn có thể thỏa sức học hỏi, nghiên cứu, sáng tạo. Cùng xem FPTU Business Club có gì đặc biệt nhé!
FPTU Business Club (FBC) là câu lạc bộ học thuật, nơi hội ngộ của rất nhiều những con người xuất sắc, sáng tạo và ham học hỏi. CLB thường xuyên tổ chức những buổi training về các kiến thức kinh doanh, kỹ năng mềm như tin học văn phòng, viết Mail, kỹ năng thuyết trình, tìm việc làm,... Đây đều là những kỹ năng cần thiết cho việc học và làm đẹp cho CV của các thành viên. Ngoài ra, FBC còn thường xuyên tổ chức những buổi Workshop lớn nhỏ dành cho các thành viên CLB hoặc cho sinh viên trường F để mọi người có thể trò chuyện, trao đổi với các diễn giả, các nhà Bảo trợ Chuyên môn đầy kinh nghiệm.

FBC cũng là cái nôi sinh ra rất nhiều nhân vật có tiếng của trường F như Cóc vàng, sinh viên xuất sắc, hay những sinh viên có thành tích cao tại các cuộc thi học thuật lớn. Mang sứ mệnh tạo nên môi trường giúp các bạn sinh viên có niềm đam mê với kinh tế có thể học hỏi, trau dồi nhiều kiến thức thực tiễn, được thực hành và tiếp xúc với các vấn đề, tình huống thực tế, FBC thường xuyên tổ chức những hoạt động từ nội bộ đến quy mô lớn hơn như: Workshop, talkshow, training (nội bộ), cuộc thi học thuật, khởi nghiệp cho đến các dự án vẫn đang hoạt động sôi nổi tại trường. 
Bên cạnh đó, FBC còn được tạo điều kiện và giúp đỡ rất nhiều từ các phòng ban như Phòng Quan Hệ Doanh Nghiệp và Cựu Sinh Viên, các anh chị cán bộ phòng IC - PDP,... cùng các CLB tại trường Đại học FPT Hà Nội.

Để tạo nên được sự “giàu có” này là sự nỗ lực, phát triển không ngừng của các thành viên sau hơn 10 năm hoạt động, là thầy cô, bạn bè và đối tác luôn sẵn sàng giúp đỡ và đồng hành cùng nhà Biz trên mọi nẻo đường. 

FPTU Business Club đã chính thức mở đơn tuyển quân Gen 11 từ ngày 30/1/2023. Nếu bạn có niềm yêu thích với kinh doanh, bạn đang tìm một môi trường học tập và trau dồi kiến thức thực tiễn, rèn luyện kỹ năng mềm thì FBC sẽ là một trong những sự lựa chọn tuyệt vời. Bật mí cho bạn một điều, nhà Biz có vía Cóc Vàng, sinh viên xuất sắc cực mạnh! Truy cập và theo dõi fanpage FPTU Business Club - FBC để tìm hiểu thêm về câu lạc bộ ‘Giàu nhất’ FPT nhé.', 1);






		   INSERT INTO [dbo].[blog]
           ([title], [thumnail_url], [content], [status])
     VALUES
           (N'Khám phá trải nghiệm hoạt động CLB cho tân sinh viên Đại học FPT Hà Nội', N'https://hanoi.fpt.edu.vn/wp-content/uploads/2022/06/284070977_5896153853747500_79006143854790705_n.jpeg', 
		   N'Với hệ thống CLB phong phú trải dài từ học thuật đến nghệ thuật, giải trí, thể thao, trải nghiệm hoạt động CLB ở Đại học FPT là một “đặc sản” không thể bỏ lỡ đối với bất kỳ sinh viên nào. 

5 lý do trải nghiệm hoạt động CLB ở Đại học FPT được sinh viên hưởng ứng

Hòa mình vào các hoạt động sôi nổi của CLB là một phần không thể thiếu trong những năm tháng thanh xuân của sinh viên Đại học FPT, giúp tuổi trẻ của các bạn thêm màu sắc, trải nghiệm và kỷ niệm, cụ thể là thu nhận thêm 5 lợi ích dưới đây:
Tìm kiếm niềm vui: Bên cạnh những giờ học hành, thi cử căng thẳng, việc tham gia các CLB sẽ mang lại những khoảnh khắc thư giãn, giải trí, giúp sinh viên được sống trong tuổi trẻ đầy nhiệt huyết, được chơi và làm việc với những người có chung sở thích, thói quen. Khi ra trường, các bạn bạn sẽ mang theo mình những kỷ niệm thời thanh xuân mà không phải ai cũng có.
Nâng cao kiến thức: Với hệ thống CLB phong phú, đa dạng lĩnh vực, mỗi lựa chọn "ngôi nhà thứ hai" đều mang lại nhiều giá trị về kiến thức cho các thành viên, ví dụ: CLB học thuật giúp sinh viên bổ trợ và nâng cao kiến thức chuyên ngành, CLB nghệ thuật giúp thành viên phát triển năng khiếu, CLB tình nguyện giúp học sinh sinh viên nhận thức rõ hơn về trách nhiệm cộng đồng…
Rèn luyện kỹ năng mềm: CLB là nơi học sinh sinh viên có cơ hội rèn luyện kỹ năng mềm miễn phí như kỹ năng giao tiếp, thuyết trình, lãnh đạo, xử lý tình huống, làm việc nhóm, tổ chức sự kiện… Môi trường của CLB cũng là bệ phóng giúp học sinh sinh viên thêm tự tin, năng động và đến gần hơn với nhiều cơ hội tốt.
Tích lũy kinh nghiệm: Sinh viên Đại học FPT có thể tích lũy được rất nhiều kinh nghiệm đáng quý trong học tập, cuộc sống khi tham gia CLB. Đó có thể là kinh nghiệm được chia sẻ từ thầy cô, anh chị tiền bối đi trước, hoặc trong quá trình hoạt động CLB mà các bạn tự học hỏi, trau dồi và đúc rút ra cho mình.
Mở rộng vòng tròn mối quan hệ: Sinh viên sẽ được làm quen, được học hỏi và được mở rộng mối quan hệ với rất nhiều bạn bè, anh chị có cùng sở thích, mối quan tâm như mình. Qua quá trình cùng làm việc, sinh hoạt CLB mà các thành viên có thể học hỏi lẫn nhau, cùng nhau phát triển và hoàn thiện hơn cả về kỹ năng, kiến thức…
' ,1);


 INSERT INTO [dbo].[blog]
           ([title], [thumnail_url], [content], [status])
     VALUES
           (N'Gần 40 CLB Đại học FPT Hà Nội quẩy tưng bừng tại CLUB DAY', N'https://hanoi.fpt.edu.vn/wp-content/uploads/2022/06/285099777_5896153797080839_7437390215826070036_n.jpeg', N'CLUB DAY 2022 do Phòng hợp tác Quốc tế và Phát triển cá nhân IC-PDP phối hợp cùng 35 câu lạc bộ tổ chức đã diễn ra vào ngày 03/06/2022, mang tới không khí cực "cháy" ở Hola sau những ngày vắng bóng vì ảnh hưởng của dịch bệnh.  

Ngày hội CLUB DAY đã trở lại với một màu sắc hoàn toàn mới lạ sau những tháng ngày vắng bóng. 35 gian hàng đại diện cho màu sắc riêng biệt của 35 Câu lạc bộ/Đội nhóm đã thể hiện đúng "chất" sinh viên trường F.Sau CLUB DAY, sinh viên FPTU sẽ tiếp tục được trải nghiệm vô vàn những hoạt động sự kiện hấp dẫn khác như: Water Day; Đêm sơ khảo Học bổng tài năng với sự góp mặt của dàn nghệ sĩ: Đinh Mạnh Ninh, Ngô Lan Hương, Linh Cáo; Music Show cực xịn với Binz, Gonzo, DJ Mie, Hồng Thanh... Hãy cùng đón chờ những bất ngờ sắp tới nhé!', 1);




INSERT INTO [dbo].[blog]
           ([title], [thumnail_url], [content], [status])
     VALUES
           (N'FPTU tranh cúp vô địch bóng bàn cùng sinh viên các trường Đại học - Cao đẳng Hà Nội', N'https://hanoi.fpt.edu.vn/wp-content/uploads/2024/04/435188852_893239222602294_5246891113888907803_n.jpg', N'Ngày 13, 14/04 vừa qua, CLB Bóng bàn Trường Đại học FPT đã tham gia tranh cúp giải Bóng bàn sinh viên Đại học Cao đẳng Hà Nội 2024 do Hội thể thao đại học và chuyên nghiệp thành phố Hà Nội tổ chức.

Trải qua những trận đấu căng thẳng và không kém phần cay cấn, các thành viên đã thi đấu với tinh thần quyết tâm cao. Nhờ thể hiện được kỹ thuật và sự phối hợp ăn ý, các thành viên của FPTU đã vượt qua nhiều đối thủ xuất sắc để giành được chức vô địch ở nội dung đôi nam nữ. Chiến thắng này là niềm tự hào của CLB và cũng là động lực để CLB Bóng bàn tiếp tục phát triển trong hành trình sắp tới. Chúc cho các CLB sẽ gặt hái được nhiều thành tựu hơn nữa trong tương lai.', 1);

		   
INSERT INTO [dbo].[blog]
           ([title], [thumnail_url], [content], [status])
     VALUES
           (N'Nhìn lại đêm nhạc kỉ niệm 10 năm thành lập CLB Melody FPTU: Lắng đọng và cảm xúc', N'https://hanoi.fpt.edu.vn/wp-content/uploads/2023/05/346612113_1064220601204412_9125326122664955155_n.jpg', N'Tối 11-5, đêm nhạc Melody Live Concert: Born To Sing do CLB âm nhạc Melody Trường Đại học FPT Hà Nội tổ chức đã diễn ra thành công. Đây là sự kiện đánh dấu quá trình trưởng thành và phát triển của CLB trong suốt 10 năm qua. 
bahçelievler escort
Tham dự đêm nhạc hội có sự góp mặt của các cán bộ đến từ Ban Tuyển sinh trường Đại học FPT, phòng Hợp tác Quốc tế và Phát triển cá nhân (IC PDP), cựu chủ nhiệm CLB Melody qua các thời kì cùng đông đảo phụ huynh và sinh viên Đại học FPT. 

Live Concert với tên gọi "Born to Sing" cũng chính là slogan của Melody FPTU Club. Trải qua 10 năm hoạt động, CLB Melody đang ngày càng lớn mạnh, trở thành ngôi nhà chung và cũng là cầu nối gắn kết rất nhiều thế hệ sinh viên có chung niềm đam mê âm nhạc.  Concert thu hút đông đảo sinh viên bằng những tiết mục âm nhạc từ sâu lắng đến sôi động, được thể hiện bởi các thành viên CLB và sinh viên nhà trường. Đặc biệt, chương trình còn có sự góp mặt của khách mời nổi tiếng - nhóm nhạc DaLab. Với những tiết mục đặc sắc và chuẩn bị kỹ lưỡng, đêm nhạc hội đã mang tới những giây phút thăng hoa và sâu lắng, góp phần tạo nên những dấu ấn thật đẹp về chặng đường đã qua và sắp tới của CLB Melody FPTU. ', 1);


	   
INSERT INTO [dbo].[blog]
           ([title], [thumnail_url], [content], [status])
     VALUES
           (N'Lộ diện quán quân cuộc thi lồng tiếng ReSound 2022', N'https://hanoi.fpt.edu.vn/wp-content/uploads/2022/12/DSC2424-2048x1365.jpg', N'Sau hơn 6 tháng khởi động và tranh tài, ReSound 2022 đã đi tới hồi kết. Gây ấn tượng với khả năng chuyên môn, biểu cảm xuất sắc, Đội thi Funky Pumpkins đến từ khối ngành ngôn ngữ Trường Đại học FPT Hà Nội đã trở thành Quán quân của cuộc thi.

RESOUND 2022 là cuộc thi lồng tiếng thường niên dành riêng cho các bạn sinh trường Đại học FPT Hà Nội, được tổ chức bởi câu lạc bộ Tiếng Anh. Đây là sân chơi hấp dẫn, khơi dậy niềm đam mê điện ảnh cũng như rèn luyện khả năng Tiếng Anh của các bạn sinh viên. Cuộc thi diễn ra trong vòng 7 tuần với 3 vòng thi: vòng đơn, vòng bảng và chung kết. Sản phẩm của các đội sẽ được chấm trên nhiều tiêu chí khác nhau, bao gồm chuyên môn, ý tưởng và khả năng teamwork. Vừa qua, vòng chung kết của cuộc thi được diễn ra vào ngày 11/12/2022 tại tầng 5 Hội trường Gamma, Trường Đại học FPT Hà Nội. Chung kết có với sự xuất hiện của dàn ban giám khảo vô cùng chất lượng:

Cô Darlenne Pebris Helsabeck là Thạc sĩ Giáo dục về Giảng dạy Nâng cao, Nhận chứng chỉ Giảng dạy bậc Đại học của Đại học Harvard, và là Nhà giáo của năm 2016 tại Đại học FPT.
Thầy Miguel Ortega Lorenzo với 8 năm kinh nghiệm giảng dạy tiếng Anh, Chứng chỉ IELTS của IDP IELTS, và là Quán quân cuộc thi nói tiếng Anh Extemporaneous của Đại học Western Mindanao State University Philippines
Anh Đào Anh Sơn khi anh là Điều phối viên Quốc gia Hội nghị Hội đồng Sinh viên ASEAN (AUSCU) lần thứ IV, Chủ nhiệm MIC - CLB MC Học viện Ngoại giao, Trưởng BTC DAVs Leaders 2020 - Chương trình Tìm kiếm Thủ lĩnh Sinh viên Học viện Ngoại giao. Vượt qua hai vòng thi đấu vô cùng căng thẳng và khắc nghiệt, Top 8 đội chơi có thành tích xuất sắc nhất đã có những bước chuyển mình ngoạn mục, vượt qua hàng chục đội chơi để tiến đến trận chung kết của vòng 3, đó là: Chaotic Voices, Passionate, Powerpuff Girls, Funky Pumpkins, Winged Mermaids, Rebel 4 Life, Fountain Of Youth, Kanabiz. Sau hơn 6 tháng đồng hành và dõi theo các đội chơi, Lê Thị Thương Huyền – Phó chủ nhiệm câu lạc bộ Tiếng Anh FEC trường Đại học FPT Hà Nội, đồng thời là Trưởng Ban Tổ Chức của cuộc thi ReSound 2022 chia sẻ: “Top 8 đội bước đến vòng chung kết ReSound 2022 thực sự rất xuất sắc. Điều mình đánh giá cao nhất ở các đội là tâm huyết và mong muốn mang ý tưởng đó tới các ban giám khảo và khán giả tại hội trường. Và cả 8 đội, sau hơn 2 tháng họ đã đem tinh thần và sự nhiệt huyết đến đêm chung kết cuộc thi. Các Ban giám khảo cũng đánh giá trên tiêu chí sự biểu cảm ngữ điệu, tinh thần đồng đội tính khác biệt, sáng tạo và sự tâm huyết của mình vào cuộc thi.”

Mùa đầu tiên của cuộc thi khép lại với những thành công vang dội. Ban tổ chức hi vọng trong những mùa sau, CLB Tiếng Anh FEC Trường Đại học FPT Hà Nội sẽ tiếp tục tạo ra những sân chơi hấp dẫn nhất, sôi động nhất cho các bạn sinh viên.  ', 1);


	
INSERT INTO [dbo].[blog]
           ([title], [thumnail_url], [content], [status])
     VALUES
           (N'"Hoàng tử Indie" Vũ là khách mời show nhạc đặc biệt của CLB Melody ĐH FPT', N'https://hanoi.fpt.edu.vn/wp-content/uploads/2022/05/280820353_5838243802871839_9217074321232839599_n.jpeg', N'Ngày 20/5, Vũ sẽ có mặt ở Đại học FPT cơ sở Hoà Lạc và mang những bản HIT đình đám tới không gian cực "chill" của Hola. 

Chàng nghệ sĩ của những bản tình ca - Vũ, hiện đang là ca sĩ kiêm nhạc sĩ nổi tiếng tại Việt Nam. Được giới yêu nhạc mến mộ bởi tài năng và những ca khúc rất “tình”, “Hoàng tử Indie” Vũ luôn xuất hiện với hình ảnh chàng ca sĩ lãng tử mang trong mình sự đơn giản tinh tế và đốn tim khán giả bằng chất giọng vô cùng ngọt ngào, da diết. Sở hữu hàng loạt bản hit làm nên tên tuổi của Vũ trong giới Indie Việt như “Đông kiếm em”, “Mùa mưa ngâu nằm cạnh”, “Chuyện những người yêu xa”,... và tiêu biểu nhất là cực phẩm tình ca “Lạ lùng”, sự góp mặt của nam ca sĩ Vũ trong đêm nhạc Tình "Tứ" chắc chắn sẽ khiến các bạn khán giả phải “lụi tim” và đứng ngồi không yên đấy.

Tối ngày 20/5 tới đây, các bạn sinh viên trường Đại học FPT Hà Nội sẽ được gặp Vũ và trực tiếp nghe những bản HIT đình đám cùng giọng ca đầy cảm xúc của anh trong chương trình "Tình Tứ". Vậy các bạn còn chần chừ gì nữa, lên đồ đến Tình "Tứ" để chill cùng Vũ thôi!
🎶 𝐌𝐔𝐒𝐈𝐂 𝐒𝐇𝐎𝐖| TÌNH “TỨ” 🎶
⏰ Thời gian: 19h30 - 20/5/2022
📍 Địa điểm: Đường 30m - Đại học FPT Hà Nội', 1);


		   
INSERT INTO [dbo].[blog]
           ([title], [thumnail_url], [content], [status])
     VALUES
           (N'548 đơn vị máu - "Vòng tay ấm 9" lập nên kỉ lục mới', N'https://hanoi.fpt.edu.vn/wp-content/uploads/2019/03/vong-tay-am-9-igo-fpt-ha-noi-1.jpg', N'Sau 2 ngày suôn sẻ, “Vòng tay ấm 9” – Ngày hội hiến máu tình nguyện thường niên do CLB vì cộng đồng iGo tổ chức đã thu về thành công 548 đơn vị máu, góp phần cứu giúp hàng trăm mảnh đời kém may mắn. Tuy chỉ diễn ra trong vỏn vẹn có 2 ngày, nhưng quá trình lên kế hoạch và chuẩn bị lại là một câu chuyện dài trước đó mà “Vòng tay ấm 9” không hẳn lúc nào cũng “thuận buồm xuôi gió”.

Kể về những trở ngại gặp phải trong quá trình ấy, bạn Phan Trương Thảo – trưởng ban tổ chức chia sẻ: “Khó khăn thì có nhiều, nhất là hôm 28/2, sự kiện của bọn mình bị trùng với một sự kiện khác trong trường, nên “Vòng tay ấm 9” không thể được tổ chức tại sảnh Beta đúng như kế hoạch. Bọn mình đã tìm đủ mọi cách để di dời địa điểm tổ chức nhưng bất thành, cũng chẳng thể lùi hay tiến lịch trình vì trường mình còn rất nhiều sự kiện khác nữa. Sau một thời gian suy nghĩ, bọn mình cuối cùng cũng thương lượng được BTC của chương trình đó, nhưng vẫn phải để “Vòng tay ấm 9” kết thúc sớm hơn dự kiến vài giờ đồng hồ. Tuy vậy, mọi người đều chấp nhận dành thời gian đến để tham dự cùng chúng mình vào ngày hôm sau, để rồi cuối cùng số liệu lại chứng minh, năm nay vẫn là một năm kỷ lục của “Vòng tay ấm”. 9 mùa của “Vòng tay ấm” đều là những năm thành công nối tiếp thành công. Trong suốt chặng đường ấy, chương trình đã kêu gọi, đóng góp được hơn 2000 đơn vị máu cho ngân hàng máu quốc gia. Với thông điệp “Một giọt máu cho đi – Một cuộc đời ở lại”, chương trình giữ vững và phát triển truyền thống tương thân tương ái của dân tộc ta. Hy vọng CLB vì cộng đồng iGo sẽ mãi giữ được ngọn lửa nhiệt huyết ấy, cùng nhau tổ chức thêm nhiều chương trình ấn tượng và có ý nghĩa như vậy. BTC hẹn gặp lại các bạn ở “Vòng tay ấm 10” với những thành công vang dội hơn nữa.', 1);


		   
INSERT INTO [dbo].[blog]
           ([title], [thumnail_url], [content], [status])
     VALUES
           (N'Đại học FPT tổ chức talkshow về khởi nghiệp', N'https://daihoc.fpt.edu.vn/wp-content/uploads/2023/02/khoi_nghiep_3-768x512.jpeg', N'Nhằm giúp sinh viên có định hướng rõ ràng cho ý tưởng khởi nghiệp, Đại học FPT vừa tổ chức talkshow với chủ đề ‘Choosing a Startup Idea’.

Talkshow về chủ đề “Choosing a Startup Idea” (Cách chọn ý tưởng khởi nghiệp) thu hút sự tham gia của hơn 800 sinh viên Đại học FPT. Diễn giả của buổi talkshow là ông Lê Anh Tiến – CEO Công ty cổ phần công nghệ Chatbot Việt Nam. Tại đây, ông Tiến đã chia sẻ các kinh nghiệm của mình về quá trình khởi nghiệp và cung cấp những lời khuyên vô giá cho sinh viên có ý định khởi nghiệp. Ngoài các kiến thức về lựa chọn ý tưởng khởi nghiệp, ông còn đưa ra những kinh nghiệm thực tế và các lời khuyên hữu ích.

Buổi talkshow đã thu hút được sự quan tâm của nhiều sinh viên, đặc biệt là những sinh viên đam mê khởi nghiệp và muốn tìm hiểu thêm về cách lựa chọn ý tưởng khởi nghiệp. Nhiều sinh viên đã bày tỏ sự cảm kích với những kiến thức bổ ích mà buổi talkshow đã mang lại. Thạc sĩ Đồng Quin – giảng viên bộ môn Phát triển khởi nghiệp – Đại học FPT, cho biết buổi talkshow đã giúp cho sinh viên hiểu rõ hơn về quá trình lựa chọn ý tưởng khởi nghiệp, biết cách đánh giá một ý tưởng startup có tiềm năng hay không, cũng như các rủi ro và cơ hội trong quá trình khởi nghiệp.

Chia sẻ sau buổi talkshow, tiến sĩ Phan Gia Hoàng – trưởng ban tổ chức – đánh giá cao sự tham gia tích cực của sinh viên, đặc biệt là trong phần thảo luận và trao đổi về các vấn đề liên quan đến startup. Anh cũng lưu ý rằng, quá trình khởi nghiệp không chỉ đơn thuần là việc tạo ra một sản phẩm hoặc dịch vụ mới, mà còn liên quan đến nhiều yếu tố khác như tìm kiếm đối tác, quản lý tài chính, marketing và phát triển thị trường.

Tiến sĩ Hoàng cũng nhấn mạnh tầm quan trọng của việc xây dựng một mạng lưới liên kết trong cộng đồng khởi nghiệp, từ đó tạo ra sự hỗ trợ và động lực để phát triển ý tưởng và thành công trong hành trình khởi nghiệp.

“Quan trọng nhất, buổi talkshow đã cung cấp cho sinh viên một cái nhìn tổng quan về quá trình khởi nghiệp và giúp họ có được những kiến thức, kinh nghiệm và lời khuyên quý giá trong việc lựa chọn và phát triển ý tưởng”, tiến sĩ Phan Gia Hoàng nói.', 1);


		   
 
		   
INSERT INTO [dbo].[blog]
           ([title], [thumnail_url], [content], [status])
     VALUES
           (N'SV trường F sẽ tham gia tranh tài cuộc thi Sinh viên với An toàn thông tin Asean 2024', N'https://daihoc.fpt.edu.vn/wp-content/uploads/2024/06/3eedc739-dd89-4c25-b1aa-9b21afb5c387-768x512.jpg', N'Tháng 9/2024 tới đây, sinh viên trường ĐH FPT sẽ tham gia cuộc thi Sinh viên với An toàn thông tin Asean 2024. Đây là sân chơi uy tín quy tụ những tài năng trẻ xuất sắc nhất trong lĩnh vực an toàn thông tin từ khắp khu vực Đông Nam Á với tổng giải thưởng trị giá hơn 200 triệu đồng.

Đây là lần thứ 7 trường ĐH FPT tham gia tranh tài nhằm học hỏi, giao lưu, cọ xát về chuyên môn với các trường đại học khác trong và ngoài nước. Đặc biệt trong đợt đăng kí lần này, đội tuyển tham dự của Trường Đại học FPT sẽ được mở rộng cho tất cả các chuyên ngành học khối Công nghệ thông tin của trường đăng ký.

Vừa qua, nhà trường đã tổ chức sự kiện FPT Uni SecAthon 2024 là một cuộc thi chuyên sâu về kiến thức An toàn thông tin do Phòng Công tác sinh viên phối hợp cùng Bộ môn An toàn thông tin tổ chức nhằm tuyển chọn và tìm kiếm nhân tố tài năng dự thi cuộc thi này. Bạn Phạm Việt Thắng sinh viên khóa 17 chuyên ngành Digital Marketing thuộc nhóm 0day.today? đại diện FPTU đi thi đấu SVATTT Asean 2024 chia sẻ “Với tất cả sinh viên học chuyên ngành An toàn thông tin thì em nghĩ ai cũng mong muốn được tham gia SVATTT Asean 1 lần trong đời. Vì đó là nơi hội tụ tất cả các nhân tài trong ngành bảo mật dưới 26 tuổi ở Việt Nam nói riêng và Asean nói chung. Được giao lưu, cạnh tranh, thi đấu với những anh tài như thế là một dịp để chúng mình học hỏi và tiếp xúc với những kỹ năng, kỹ thuật bậc cao nhất trong ngành An toàn thông tin. Ngoài ra, nếu đạt ở vị trí top 4 vòng chung khảo ở top 20 còn có cơ hội tham gia 2 giải lớn được ví như World Cup của ngành ATTT”.

Năm 2024 là năm thứ mười bảy cuộc thi Sinh viên với An toàn thông tin được tổ chức tại Việt Nam và là lần thứ sáu cuộc thi mở rộng tầm ảnh hưởng tới các nước ASEAN. Cuộc thi nhằm mục đích tuyên truyền và đẩy mạnh phong trào nghiên cứu, học tập, trao đổi kinh nghiệm trong lĩnh vực ATTT.', 1);





INSERT INTO [dbo].[blog]
           ([title], [thumnail_url], [content], [status])
     VALUES
           (N'Cặp đôi thủ khoa và mối tình thập kỷ khiến dân tình trầm trồ “hoá ra học bá yêu nhau như vậy', N'https://daihoc.fpt.edu.vn/wp-content/uploads/2024/06/photo-1-17188553880441275883743.jpeg', N'Tuyết Chi và Lộc Tân là cặp đôi thủ khoa với mối tình thập kỷ nổi tiếng tại Trường ĐH FPT phân hiệu Đà Nẵng. Đồng hành từ những năm tháng phổ thông, cặp đôi vì nhau và nỗ lực để rồi cùng “đầu quân” vào một doanh nghiệp có tiếng trong lĩnh vực công nghệ.

Chuyện tình thập kỷ của học bá

Tháng 10/2023, Châu Thị Tuyết Chi và Nguyễn Lộc Tân lần lượt được xướng tên với danh hiệu Thủ khoa nhóm ngành Quản trị kinh doanh và Thủ khoa khối ngành Công nghệ thông tin. Tình yêu thanh xuân vườn trường của các học bá tưởng chừng chỉ có trên phim, nhưng cặp đôi này đã khiến bao người gật gù “phim cũng phải lấy chất liệu từ đời thật”.

Tình cảm chớm nở khi cả hai là học sinh lớp 9 rồi được vun đắp trong suốt thời học sinh phổ thông. Cuối năm lớp 12, khi Tân quyết định trở thành sinh viên chuyên ngành Kỹ thuật phần mềm Trường ĐH FPT phân hiệu Đà Nẵng thì Chi lại phân vân giữa ngành Quản trị kinh doanh tại đây hay theo đuổi ngành Dược. “Lúc đó mình nhận được học bổng 70% đã chọn Trường ĐH FPT luôn, thấy có duyên với ngôi trường này chứ không phải vào đây để học cùng bạn trai đâu nhé. Và 4 năm qua, mình chưa một lần thất vọng về quyết định này”, Chi hài hước bật mí.

Dù học cùng trường nhưng khác ngành nên Chi và Tân không có quá nhiều hoạt động chung. Trải nghiệm đáng nhớ nhất có lẽ là Học kỳ quân sự. Lần đầu tiên xa nhà lâu như vậy, Chi cảm thấy tủi thân khi thấy các bạn có gia đình vào thăm dịp cuối tuần, nhưng có Tân an ủi nên nỗi buồn cũng vơi đi phần nào.

“Năm tháng sau đó dù vui hay buồn, tụi mình đều san sẻ với nhau. Yêu nhau khá lâu chẳng ai thấy nhàm chán vì không có chuyện “đứng núi này trông núi nọ”. Cả hai không so sánh đối phương với người khác, mà động viên nhau phát triển bản thân. Mình với Tân hiếm khi giấu nhau chuyện gì, tụi mình thoải mái chia sẻ trong mọi tình huống”, cô nàng cho hay. Hiện tại, cặp đôi thủ khoa đều làm việc tại DataHouse Consulting chi nhánh Việt Nam (Công ty tư vấn công nghệ và phát triển phần mềm có trụ sở tại Hawaii, Hoa Kỳ). Tân đang giữ vị trí Middle Software Engineer và phụ trách nhiều dự án quan trọng còn Chi đảm nhiệm vị trí Business Analyst với nhiều cơ hội làm việc nước ngoài, gặp gỡ chuyên gia trong lĩnh vực IT. Đây cũng là công ty mà cả hai đã làm việc từ trước khi tốt nghiệp.

Trong thời gian tới, cả hai đều tập trung cho phát triển bản thân cũng như vun đắp cho mối tình thập kỷ của mình. Quả thật, Tuyết Chi và Lộc Tân là những minh chứng rõ ràng cho sự đam mê, kiên nhẫn và những nỗ lực của các bạn sinh viên Trường Đại học FPT nói riêng, thế hệ Z nói chung.

', 1);

-- Bảng 'blog_category'
CREATE TABLE blog_category (
    blog_id INT,
    setting_id INT,
    PRIMARY KEY (blog_id, setting_id),
    FOREIGN KEY (blog_id) REFERENCES blog(blog_id),
    FOREIGN KEY (setting_id) REFERENCES setting(setting_id)
);
GO

--Bảng 'view_tokens'
CREATE TABLE view_tokens (
    id INT PRIMARY KEY IDENTITY(1,1),
    token VARCHAR(255) NOT NULL UNIQUE,
    club_id INT NOT NULL,
    expiration_time DATETIME NOT NULL,
    FOREIGN KEY (club_id) REFERENCES club(club_id)
);

INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'7116ee4e-5d48-42ea-85ad-e0466ffbbff8', 1, CAST(N'2024-07-10T20:16:32.120' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'fba3827f-5ea8-453d-9a72-1c5d26c9bcf1', 1, CAST(N'2024-07-10T20:16:43.810' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'40be5ad9-c076-4ab3-a1c4-e72a21b7c18a', 1, CAST(N'2024-07-10T20:23:10.700' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'8eb12217-c712-4525-b576-bbf5421abdda', 1, CAST(N'2024-07-10T20:24:16.937' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'613503bd-a660-44f2-bba5-4e65f1187a94', 1, CAST(N'2024-07-10T20:27:29.113' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'd49f9a6f-226d-4f95-8826-412c69ad52a9', 1, CAST(N'2024-07-10T20:27:29.260' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'd582f546-a8e1-46ad-ab3b-85fca67621d2', 1, CAST(N'2024-07-10T20:27:29.463' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'747b3aca-3f00-4e51-93da-deb723711f6d', 1, CAST(N'2024-07-10T20:27:39.000' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'0ccceab4-df84-4fe5-a3a0-64741aa45a08', 1, CAST(N'2024-07-10T20:27:48.817' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'6cd63290-7c09-4e49-b0e4-cbeadce19b11', 1, CAST(N'2024-07-10T20:41:38.077' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'0ff89110-8597-4c5f-b340-8720b57a07b0', 1, CAST(N'2024-07-10T20:44:45.940' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'1a042ef3-f4d2-4d51-8f60-44f608c97765', 1, CAST(N'2024-07-10T20:44:59.953' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'fd00acc9-2d36-4f55-b834-5f03e2bb9bff', 1, CAST(N'2024-07-10T21:00:23.807' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'0f4ad9f3-b26b-45e8-8705-83b36d0d48f6', 1, CAST(N'2024-07-10T21:09:37.690' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'3e1c8453-cf88-4b79-bb4f-b6e8143ccc1a', 1, CAST(N'2024-07-10T21:09:58.850' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'f2067a24-24d3-44e4-92a1-866520dd4e88', 1, CAST(N'2024-07-10T21:16:14.987' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'81da4c65-4c47-40b6-b876-d335aa417867', 1, CAST(N'2024-07-13T10:50:00.773' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'3997e932-5bd5-4b35-8632-256a9ce7576c', 1, CAST(N'2024-07-14T12:40:13.950' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'2b1021ab-01f3-466f-9421-c9357cc6eb17', 1, CAST(N'2024-07-14T12:45:36.257' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'f06db3a2-4f95-46ad-b615-f3e552f669ac', 1, CAST(N'2024-07-14T22:12:17.653' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'b517e9dd-2cfb-4ce6-8b00-12df53b779cc', 1, CAST(N'2024-07-14T22:52:26.247' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'982bcc0f-2526-47d0-8c15-9f3ba2f0fc40', 1, CAST(N'2024-07-16T11:00:59.353' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'4b66cfa5-8cef-4f2d-9a19-1dcf818bb701', 1, CAST(N'2024-07-18T01:47:41.230' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'4ef95995-a7f8-4a76-af44-fd8bcdd292f9', 1, CAST(N'2024-07-18T01:48:32.443' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'1e4f4d5d-f345-4aff-a8ab-cd076c0f5441', 1, CAST(N'2024-07-18T01:50:10.603' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'990c4f10-1e19-47e8-967f-c699b24c6b8c', 1, CAST(N'2024-07-18T01:55:10.310' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'2089eb84-8bc1-40df-bc81-99c04cdcde90', 1, CAST(N'2024-07-18T01:56:16.387' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'92f573d6-bd6c-4ec8-8f46-89d5998c33f0', 1, CAST(N'2024-07-18T01:56:34.230' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'072d1ab3-962b-4938-aa90-39cbfceb9a6a', 1, CAST(N'2024-07-18T01:58:45.013' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'bbce8443-51da-45f7-af22-d4009ccd24d3', 1, CAST(N'2024-07-18T01:59:09.537' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'c6452fd3-2df2-46eb-ac6b-76355931ccb2', 1, CAST(N'2024-07-18T02:00:36.683' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'242d0c6c-2841-4461-af59-e6cb9119fa54', 1, CAST(N'2024-07-18T02:01:43.173' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'738f4e54-df4c-4c6e-992b-102f7bdd4030', 1, CAST(N'2024-07-18T02:06:37.547' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'5f31adf4-2665-4f55-a51a-e831e224cc95', 1, CAST(N'2024-07-18T02:08:23.763' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'5acaedde-343b-4903-b96e-7ebe7e68fd8c', 1, CAST(N'2024-07-18T02:08:46.700' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'1335caae-2bb7-4989-a9cf-e12c48336fa4', 1, CAST(N'2024-07-18T02:14:49.050' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'1223c0cd-9e78-4c4c-9f44-d2029191717c', 1, CAST(N'2024-07-18T02:15:13.800' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'90cc8347-2195-4dbe-a54e-2efccbd68258', 1, CAST(N'2024-07-18T02:16:14.243' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'd1d357aa-969d-4110-97c6-a67eea147883', 1, CAST(N'2024-07-18T02:17:03.153' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'7618fc93-35b5-45c2-9d7d-a038e717308f', 1, CAST(N'2024-07-18T02:17:35.110' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'90278399-af42-49df-a4ad-446f5ad2947e', 1, CAST(N'2024-07-18T02:24:55.690' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'4ee60bc4-60ec-4d65-99b4-1a8f05e4efbb', 1, CAST(N'2024-07-18T02:25:25.920' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'e3c897a0-3b4f-4df2-8dd0-7ce70828479c', 1, CAST(N'2024-07-18T02:26:25.240' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'4ef9a616-4ae1-4223-b5c6-541cbf8fdcc7', 1, CAST(N'2024-07-18T02:59:15.217' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'196cd892-43bb-427c-8290-ea005d462be4', 1, CAST(N'2024-07-18T20:30:29.260' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'328a4ed6-d1e3-40e6-b320-2dbf54360900', 2, CAST(N'2024-07-18T20:31:23.643' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'3447df19-689e-4d53-be6c-99004e5c8ce4', 2, CAST(N'2024-07-18T20:31:30.637' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'bcf78e57-958f-4019-8bdc-5e2f5067091d', 2, CAST(N'2024-07-18T20:32:23.167' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'f0d1b71b-eec7-421a-b1e5-34a8b6de6ee1', 2, CAST(N'2024-07-18T20:34:59.737' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'5099cf80-de6c-4342-8f33-b64a209343b2', 2, CAST(N'2024-07-18T20:36:27.563' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'a9602bc0-e8d2-4996-9ffd-afd3ffbfacca', 2, CAST(N'2024-07-18T20:51:06.460' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'c3042e28-c381-4676-bdd7-0425bb0eaaf8', 2, CAST(N'2024-07-18T21:00:38.877' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'e3a6fc0a-f245-4b9b-8709-eab9a95b7a92', 1, CAST(N'2024-07-18T21:04:02.943' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'c0010792-5156-4ea9-8fcb-f0a321c99c3d', 1, CAST(N'2024-07-18T21:48:29.260' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'56826ba3-3d1e-4e3f-8aec-829a9776f73e', 2, CAST(N'2024-07-18T21:49:10.190' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'db712d75-11f5-4d76-b1e1-f9738aa878a5', 1, CAST(N'2024-07-18T21:49:25.220' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'fc2b64ff-4903-467b-b5a6-f339b1148ad2', 2, CAST(N'2024-07-18T21:49:54.407' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'12a302cd-5f8f-4c50-86fd-3ff2f693cb86', 1, CAST(N'2024-07-18T21:52:59.280' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'4813c04b-c5f2-4fe3-ab44-65e128b22cf3', 1, CAST(N'2024-07-19T09:39:15.257' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'251cabd6-17bd-4992-8202-b2aa38743424', 1, CAST(N'2024-07-19T09:39:45.557' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'8a0023a9-db7a-415c-8437-d9138beb5ce1', 1, CAST(N'2024-07-19T09:40:34.443' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'60883da7-24f5-4b79-a035-a20db7c87b2f', 1, CAST(N'2024-07-19T09:41:09.093' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'b6e92262-ecee-4a72-a6a1-391e1e8c3c8d', 1, CAST(N'2024-07-19T09:41:47.120' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'486be776-6e4a-4d30-bee8-11b43983971e', 1, CAST(N'2024-07-19T09:42:21.633' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'2f1c3aaf-dd35-459e-97fa-dac51029f993', 1, CAST(N'2024-07-19T09:44:14.753' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'88351ea8-cd26-4892-a1a4-907a14300d8c', 1, CAST(N'2024-07-19T09:44:41.973' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'd78eab89-a463-49ae-ae45-a4b9d85cb68f', 1, CAST(N'2024-07-19T09:47:22.877' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'c5fdc28a-23f4-4390-84ed-aed68758711b', 1, CAST(N'2024-07-19T10:09:18.903' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'fd0f245a-3cd4-485f-8ad9-72ec27b8bf78', 1, CAST(N'2024-07-19T10:10:24.217' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'1d013d57-2abc-474b-809a-9157baa6e5a2', 1, CAST(N'2024-07-19T10:10:52.403' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'c36fe4d4-dc68-44be-a619-8c6249a26cf8', 1, CAST(N'2024-07-19T10:11:32.613' AS DateTime))
INSERT [dbo].[view_tokens] ([token], [club_id], [expiration_time]) VALUES (N'a89ff4cc-1271-4361-8616-28c26cbd181a', 1, CAST(N'2024-07-19T11:03:17.297' AS DateTime))
