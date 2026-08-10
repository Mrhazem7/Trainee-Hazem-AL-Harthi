class Vehicles {
    constructor(id, name, company) {
        this.id = id;
        this.name = name;
        this.company = company;
    }
}

class Car extends Vehicles {
    constructor(id, name, company, carType) {
        super(id, name, company); 
        this.carType = carType;   
    }
}

class Airplane extends Vehicles {
    constructor(id, name, company, airplaneType) {
        super(id, name, company);
        this.airplaneType = airplaneType;
    }
}

class Employee {
    constructor(id, name, dateOfBirth) {
        this.id = id;
        this.name = name;
        this.dateOfBirth = dateOfBirth;
    }
}

class Driver extends Employee {
    constructor(id, name, dateOfBirth, licenseID) {
        super(id, name, dateOfBirth);
        this.licenseID = licenseID;
    }
}

class Pilot extends Employee {
    constructor(id, name, dateOfBirth, licenseID) {
        super(id, name, dateOfBirth);
        this.licenseID = licenseID;
    }
}

class Reservation {
    static reserved = []; 

    constructor(reservationID, reservationDate, employeeId, vehiclesId) {
        this.reservationID = reservationID;
        this.reservationDate = reservationDate;
        this.employeeId = employeeId;
        this.vehiclesId = vehiclesId;
    }
}

const car1 = new Car(1, 'Camry', 'Toyota', 'gas');
const car2 = new Car(2, 'Model 3', 'Tesla', 'electric');
const airplane1 = new Airplane(3, 'A320', 'Airbus', 'Passenger');

const vehiclesList = [car1, car2, airplane1];

// الموظفين
const driver1 = new Driver(101, 'Hazem', '2005-7-20', 'DL-1001');
const driver2 = new Driver(102, 'Hatan', '2007-05-20', 'DL-1002');
const pilot1 = new Pilot(201, 'reem', '1985-03-10', 'PL-2001');

const employeesList = [driver1, driver2, pilot1];

function makeReservation(reservationID, reservationDate, employeeId, vehicleId) {
    const employee = employeesList.find(emp => emp.id === employeeId);
    const vehicle = vehiclesList.find(veh => veh.id === vehicleId);

    if (!employee) {
        console.log(`❌ لا يوجد موظف بالرقم ${employeeId}`);
        return;
    }
    if (!vehicle) {
        console.log(`❌ لا توجد مركبة بالرقم ${vehicleId}`);
        return;
    }

    if (vehicle instanceof Car && !(employee instanceof Driver)) {
        console.log(`❌ عذرًا، لا يمكن إسناد السيارة "${vehicle.name}" للموظف "${employee.name}" لأنه ليس سائقًا.`);
        return;
    }

    if (vehicle instanceof Airplane && !(employee instanceof Pilot)) {
        console.log(`❌ عذرًا، لا يمكن إسناد الطائرة "${vehicle.name}" للموظف "${employee.name}" لأنه ليس طيارًا.`);
        return;
    }

    const reservation = new Reservation(reservationID, reservationDate, employeeId, vehicleId);
    Reservation.reserved.push(reservation);
    console.log(`✅ تم حجز "${vehicle.name}" للموظف "${employee.name}" بنجاح (رقم الحجز: ${reservationID}).`);
}

console.log('--- بدء عمليات الحجز ---');
makeReservation(1, '2026-08-10', 101, 1);   // ✅ سائق + سيارة -> نجاح
makeReservation(2, '2026-08-11', 201, 3);   // ✅ طيار + طائرة -> نجاح
makeReservation(3, '2026-08-12', 102, 3);   // ❌ سائق + طائرة -> فشل
makeReservation(4, '2026-08-13', 999, 1);   // ❌ موظف غير موجود -> فشل

console.log('\n--- كل الحجوزات المسجّلة ---');
Reservation.reserved.map(res => {
    console.log(
        `رقم الحجز: ${res.reservationID} | التاريخ: ${res.reservationDate} | الموظف: ${res.employeeId} | المركبة: ${res.vehiclesId}`
    );
});