package fileuploadUtil;

import lombok.Data;

@Data
public class FileDTO {
	private String uuid;
	private String fileName;
	private String contentType;
	
	public FileDTO(String uuid, String fileName, String contentType) {
		this.uuid=uuid;
		this.fileName=fileName;
		this.contentType=contentType;
		System.out.println(contentType);
	}
}
