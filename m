From: Cyril Novikov <cnovikov-wte42BQEg7M@public.gmane.org>
Subject: Re: Virtualization difficulty -- phandles
Date: Mon, 24 Jul 2017 16:00:20 -0700
Message-ID: <ol5uh4$qpt$1@blaine.gmane.org>
References: <ok4f5h$qg1$1@blaine.gmane.org> <59762000.7000302@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59762000.7000302-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 7/24/2017 9:27 AM, Frank Rowand wrote:
> Hi Cyril,
> 
> On 07/11/17 23:15, Cyril Novikov wrote:
>> Hi, all!
>>
>> The product that I work on supports physical device assignment (aka
>> "pass-through") to virtual machines, which means we need to take
>> portions of the physical FDT and include them in the guest FDT. This
>> needs to happen automatically in software.
> 
> Is this for Linux, or some other OS?
> 
> If Linux, do you get the FDT from /sys/firmware/fdt or some other
> method?

No, this is for a hypervisor running on bare metal, not under Linux. We 
get the device tree from the board vendor with their Linux port.

--
Cyril
