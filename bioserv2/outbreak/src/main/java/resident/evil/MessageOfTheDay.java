/*
    BioServer2 -Emulation of the long gone server for 
                Biohazard Outbreak File #2 (Playstation 2)

    Copyright (C) 2013-2019 obsrv.org (no23@deathless.net)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

package resident.evil;

import java.nio.ByteBuffer;

/**
 * Object for Message of the day
 */
public class MessageOfTheDay {
    private byte number;
    private String message;
    
    public MessageOfTheDay(int number, String message) {
        this.message = message;
        this.number = (byte) number;
    }
    
    public byte[] getPacket() {
        byte[] retval = new byte[3 + message.length()];
        retval[0] = number;
        if(message.length() == 0) retval[0] = 0;
        retval[1] = (byte)(message.length() >> 8);
        retval[2] = (byte)(message.length() & 0xFF);
        System.arraycopy(message.getBytes(), 0, retval, 3, message.length());
        return(retval);
    }
}
