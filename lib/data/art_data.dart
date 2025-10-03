import 'package:project1/models/art.dart';



final List<Art> artList = [
  Art(
    id: 1,
    name: "Mona Lisa",
    artist: "ศิลปิน Leonardo da Vinci",
    type: "สีน้ำมัน (Oil on poplar panel)",
    imagePath: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/330px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg",
    description: "ภาพเหมือนสตรีที่มีรอยยิ้มลึกลับที่สุดในโลก วาดด้วยเทคนิค sfumato ทำให้การไล่เฉดสีเรียบเนียนไร้เส้นขอบชัดเจน เป็นหนึ่งในผลงานศิลปะที่โด่งดังที่สุดของมนุษยชาติ",
  ),
  Art(
    id: 2,
    name: "Portrait of Lorenzo de’ Medici",
    artist: "ศิลปิน Michelangelo Buonarroti",
    type: "สีน้ำมันบนไม้ (ส่วนใหญ่ภาพบุคคลยุคนี้ใช้ oil หลังจากศตวรรษที่ 15)",
    imagePath: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Portrait_of_Lorenzo_di_Medici.jpg/960px-Portrait_of_Lorenzo_di_Medici.jpg",
    description: "ภาพเหมือน Lorenzo de’ Medici ดยุคแห่งฟลอเรนซ์ ผู้เป็นผู้อุปถัมภ์ศิลปะในยุคเรอเนสซองส์ จัดวางท่วงท่าด้วยความสง่างาม แสดงถึงอำนาจและความยิ่งใหญ่ของตระกูล Medici",
  ),
  Art(
    id: 3,
    name: "Portrait of Baldassare Castiglione",
    artist: "ศิลปิน Raphael Sanzio",
    type: "สีน้ำมันบนผ้าใบ (Oil on canvas)",
    imagePath: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Baldassare_Castiglione%2C_by_Raffaello_Sanzio%2C_from_C2RMF_retouched.jpg/965px-Baldassare_Castiglione%2C_by_Raffaello_Sanzio%2C_from_C2RMF_retouched.jpg",
    description: "ภาพเหมือนนักการทูตและนักเขียน Castiglione ผู้เขียน The Book of the Courtier ที่เป็นคู่มือการวางตัวของสุภาพบุรุษเรอเนสซองส์ โทนสีเรียบง่าย อบอุ่น และเต็มไปด้วยความสง่างาม",
  ),
  Art(
    id: 4,
    name: "The Last Supper",
    artist: "ศิลปิน Leonardo da Vinci",
    type: "เทคนิคผสม (Tempera + oil on plaster, ไม่ใช่ fresco แท้)",
    imagePath: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/The-Last-Supper-Restored-Da-Vinci_32x16.jpg/2560px-The-Last-Supper-Restored-Da-Vinci_32x16.jpg",
    description: "จิตรกรรมฝาผนังในโบสถ์ซานตา มาเรีย เดลเล กราซี เมืองมิลาน แสดงฉากพระเยซูและสาวก 12 คน ในมื้ออาหารสุดท้ายก่อนถูกตรึงกางเขน โดดเด่นด้วยองค์ประกอบเชิงเรขาคณิตที่ดึงสายตาไปยังพระเยซูตรงกลาง",
  ),
  Art(
    id: 5,
    name: "The Creation of Adam",
    artist: "ศิลปิน Michelangelo Buonarroti",
    type: "Fresco (สีฝุ่นผสมน้ำบนปูนเปียก)",
    imagePath: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Michelangelo_-_Creation_of_Adam_%28cropped%29.jpg/1200px-Michelangelo_-_Creation_of_Adam_%28cropped%29.jpg",
    description: "หนึ่งในภาพบนเพดานโบสถ์ซิสทีน วาติกัน ฉากที่พระเจ้าส่งชีวิตให้แก่อาดัมด้วยการเอื้อมนิ้วมือ ภาพนี้กลายเป็นสัญลักษณ์สากลของความเป็นมนุษย์และการสร้างสรรค์",
  ),
  Art(
    id: 6,
    name: "The Sistine Madonna",
    artist: "ศิลปิน Raphael Sanzio",
    type: "สีน้ำมันบนผ้าใบ (Oil on canvas)",
    imagePath: "https://upload.wikimedia.org/wikipedia/commons/7/7a/RAFAEL_-_Madonna_Sixtina_%28Gem%C3%A4ldegalerie_Alter_Meister%2C_Dresden%2C_1513-14._%C3%93leo_sobre_lienzo%2C_265_x_196_cm%29.jpg",
    description: "ภาพพระแม่มารีอุ้มพระเยซูคริสต์ทารก ล้อมด้วยนักบุญและทูตสวรรค์ ภาพนี้เป็นที่รู้จักอย่างกว้างขวาง โดยเฉพาะ ทูตสวรรค์เล็กสององค์ ที่อยู่ด้านล่างของภาพซึ่งกลายเป็นสัญลักษณ์ทางวัฒนธรรม",
  ),
  Art(
    id: 7,
    name: "The Battle of Anghiari",
    artist: "ศิลปิน Leonardo da Vinci",
    type: "เทคนิคผสม",
    imagePath: "https://masterapollon.com/wp-content/uploads/2025/03/la-bataille-danghiari-leonard-de-vinci-reproductions-tableaux-a-peinture-lhuile-813-1024x715.jpg",
    description: "เป็นภาพร่างที่เลโอนาร์โดสร้างขึ้นเพื่อบันทึกชัยชนะของฟลอเรนซ์ในการสู้รบกับมิลาน ปัจจุบันภาพต้นฉบับสูญหายไปแล้ว แต่ยังมีสำเนาและบันทึกที่บอกเล่าถึงความรุนแรงและพลังการเคลื่อนไหวในภาพ",
  ),
  Art(
    id: 8,
    name: "The Battle of Cascina",
    artist: "ศิลปิน Michelangelo Buonarroti",
    type: "ตั้งใจทำ fresco, แต่เหลือเพียงแบบร่าง (cartoon) ไม่ได้ลงสีจริง",
    imagePath: "https://upload.wikimedia.org/wikipedia/commons/d/d3/Battagliadicascina.jpg",
    description: "ออกแบบเพื่อแสดงชัยชนะของฟลอเรนซ์เช่นกัน แต่ไม่ได้เสร็จสมบูรณ์ เหลือเพียงภาพร่างที่เผยให้เห็นกล้ามเนื้อและร่างกายชายหนุ่มอันแข็งแรง ซึ่งสะท้อนความถนัดของ Michelangelo ในด้านกายวิภาค",
  ),
  Art(
    id: 9,
    name: "The School of Athens",
    artist: "ศิลปิน Raphael Sanzio",
    type: "Fresco (สีฝุ่นบนปูนเปียก)",
    imagePath: "https://upload.wikimedia.org/wikipedia/commons/4/49/%22The_School_of_Athens%22_by_Raffaello_Sanzio_da_Urbino.jpg",
    description: "ผลงานจิตรกรรมฝาผนังในวาติกันที่รวมเหล่านักปราชญ์กรีกโบราณ เช่น เพลโต และ อริสโตเติล นำเสนอแนวคิดแห่งปรัชญา วิทยาศาสตร์ และศิลปะ ผ่านองค์ประกอบสถาปัตยกรรมอันยิ่งใหญ่และการจัดวางที่สมดุล",
  ),
];

